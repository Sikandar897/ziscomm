import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziscomm/views/auth-view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /* Adding logo image to splash screen*/
          Image.asset(
            'assets/images/ZiscommLogo.png',
            fit: BoxFit.cover,
            height: height * 0.10,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            'Powerd by Sikandar Afridi',
            style: GoogleFonts.anton(letterSpacing: .6, color: Colors.white),
          ),
          SizedBox(
            height: height * 0.04,
          ),

          /* animated spinkit */ 
          const SpinKitChasingDots(
            color: Colors.white,
            size: 40,
          )
        ],
      ),
    );
  }
}
