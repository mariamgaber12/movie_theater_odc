import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'login/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        backgroundColor: firstColor,
        duration: 500,
        //splashTransition: SplashTransition.fadeTransition,
        nextScreen: const LoginScreen(),
        splash: Image.asset(
          'assets/img.png',
          width: 250,
          height: 150,
        ),
      ),
    );
  }
}