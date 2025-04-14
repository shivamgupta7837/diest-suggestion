import 'dart:async';

import 'package:diet_suggestion/home.dart';
import 'package:diet_suggestion/screens/choose_gender.dart';
import 'package:diet_suggestion/screens/login.dart';
import 'package:diet_suggestion/services/auth_keys.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logos/splash_Screen_logo.jpg",height: 300,),
      //      Text("We Focuses on managing your pantry",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
    void whereToGo() async {
    final sharePref = await SharedPreferences.getInstance();
    var isLoggedIn = sharePref.getBool(AuthKeys.LOGGEDIN);
    if (isLoggedIn != null) {
      if (isLoggedIn == true) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  HomePage())));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  LoginPage())));
      }
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>  LoginPage())));
    }
  }
}
