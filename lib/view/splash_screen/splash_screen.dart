import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, "/onBoardingScreen");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
              child: Image.asset("assets/images/app_main/app_logo.png"),
            ),
            BigText(
              text: "WearWork",
            ),
            SmallText(
              text: "Unity, Shine and Money",
              color: AppColors.neonBlue,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}