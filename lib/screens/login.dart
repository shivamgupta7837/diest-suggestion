import 'package:diet_suggestion/home.dart';
import 'package:diet_suggestion/models/google_auth_model.dart';
import 'package:diet_suggestion/screens/choose_gender.dart';
import 'package:diet_suggestion/services/login_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginService userLogin = LoginService();
  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Lottie.asset(
                    "assets/animations/login-animation.json",
                    height: 300,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Meal Predictor",
                    style: GoogleFonts.alexandria(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey.shade700),
                  ),
                  Text(
                    "Authentication",
                    style: GoogleFonts.alexandria(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey.shade800),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.7, 50)),
                  onPressed: () async {
                    bool isLoggedIn = await userLogin.isUserLoggedIn();
                    if (isLoggedIn) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    } else {
                  if( _auth.login(context: context)==true){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    
                  }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logos/google_logo.png",
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign in with Google",
                        style: GoogleFonts.alexandria(
                            color: Colors.black, fontSize: 16),
                      ),
                    ],
                  )
                  )
            ],
          ),
        ),
      ),
    );
  }
}