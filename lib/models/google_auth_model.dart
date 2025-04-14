
import 'package:diet_suggestion/models/useres.dart';
import 'package:diet_suggestion/services/auth_keys.dart';
import 'package:diet_suggestion/services/databases/firebase/users.dart';
import 'package:diet_suggestion/services/databases/local_database.dart';
import 'package:diet_suggestion/services/login_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  LoginService _userLogin = LoginService();
    MyFireStore _myFireStore = MyFireStore();
  LocalRepo _repo = LocalRepo();

  Future<bool> login({required context}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
     final isLogin =  await _userLogin.signInToGoogleAccount();
   
      if (await _userLogin.isUserLoggedIn()) {
        // will make condition true in share preferences
        await sharedPreferences.setBool(AuthKeys.LOGGEDIN, true);
        saveDetails();
        // gf.initializingDatabase();  
        return true;
        
      }else{
        print('Login failed');
        return false;
      }
    } catch (e) {
      throw Exception("Sign-in failed: $e");
    }
  }

  void saveDetails() {
    try {
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user != null) {
          _repo.saveUserCredentiails(
            userName: user.displayName.toString(),
            userEmail: user.email.toString(),
            userProfileUrl: user.photoURL.toString(),
            user_id: user.uid.toString(),
          );
        }
      });
    } catch (e) {
      throw Exception("User Data not saved: $e");
    }
  }

  Future<UserModel?> getUserData() async {
    try {  
      return await _repo.getUserCredentials();
    } catch (e) {
      throw Exception("User Data not found: $e");
    }
  }

  Future<bool> logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      await _userLogin.logoutUser();
      if (await _userLogin.isUserLoggedIn() == false) {
        await sharedPreferences.setBool(AuthKeys.LOGGEDIN, false);
      }
    } catch (e) {
      throw Exception("Logout failed: $e");
    }
    return false;
  }

  Future<bool?> isSignInDone() {
    return _repo.signInDone();
  }
}
