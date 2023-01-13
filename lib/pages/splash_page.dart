import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn().then((value) {
      if (value) {
        Future.delayed(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage())));
      } else {
        Future.delayed(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          bottom: false,
          top: false,
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    "assets/lottie/splash.json",
                    animate: true,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // reverse: true,
                    repeat: true,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Ration\nHouse",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: context.theme.accentColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
