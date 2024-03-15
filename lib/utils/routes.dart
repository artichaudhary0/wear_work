import 'package:flutter/material.dart';
import 'package:wear_work/view/on_boarding/on_boarding.dart';
import 'package:wear_work/view/signup_screen/signup_screen.dart';
import 'package:wear_work/view/splash_screen/splash_screen.dart';

class OnGenerateRouting {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/splashScreen":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case "/onBoardingScreen":
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      // case "/signUpScreen":
      //   return MaterialPageRoute(
      //     builder: (context) => const SignUpScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
