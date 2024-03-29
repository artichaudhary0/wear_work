import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: AppColors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 230,
                width: 230,
                margin: EdgeInsets.only(top: 140),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/app_main/Mesh gradient3.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 390,
                    width: 280,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/app_main/app_image.png"),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  BigText(
                    text: "Welcome to WearWork",
                    size: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  BigText(
                    text: "Where Clean Starts Here!",
                    size: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: GradientButton(
                      text: "Get Started",
                      onPressed: () {
                        Navigator.pushNamed(context, "/signUpScreen");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
