import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class MaidRegestrationSuccessScreen extends StatelessWidget {
  const MaidRegestrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/images/payment/transation.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "Your Application Received \nSuccessfully!",
                  color: AppColors.mainBlackColor,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: SmallText(
                text:
                    "Thank you for submitting your application! We have received it and will review your qualifications. Stay tuned for further updates.",
                size: 12,
                height: 1.5,
                color: const Color(0xFf8E8E8E),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "Your Unique Id : ",
                  size: 16,
                  color: AppColors.mainBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                SmallText(
                  text: " #26514",
                  color: AppColors.lightBlue,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Spacer(),
            GradientButton(text: "Continue Browsing", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
