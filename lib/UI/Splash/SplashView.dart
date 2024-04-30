import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doorlock/UI/Login/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  static const String routeName = "splash";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
            height: 200,
            child: SvgPicture.asset("assets/svg/Logo.svg")
        ),
      ),
      nextScreen:LoginView(),
      duration: 2000,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.scaleTransition,

    );
  }
}
