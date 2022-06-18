import 'package:film_fan/ui/screens/home.screen.dart';
import 'package:film_fan/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: kPrimaryColor,
      splash: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/images/logo.png',
                )),
          ],
        ),
      ),
      nextScreen: HomeScreen(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
