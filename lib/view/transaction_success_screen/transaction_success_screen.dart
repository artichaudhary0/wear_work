import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/contactinfo_tile.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key});

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
            SmallText(
              text: "Payment Successful",
              color: AppColors.mainBlackColor,
              size: 20,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 5,
            ),
            SmallText(
              text: "transaction number : 5648166",
              size: 12,
              fontWeight: FontWeight.w400,
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
                  text: "Amount Paid",
                  size: 16,
                  color: AppColors.mainBlackColor,
                ),
                SmallText(
                  text: " 1,330 ₹",
                  color: AppColors.lightBlue,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "Paid By",
                  size: 12,
                  color: AppColors.mainBlackColor,
                ),
                SmallText(
                  text: " Google Pay",
                  color: AppColors.lightBlue,
                  size: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const ContactInformationWidget(
              label: "Maid’s Name",
              value: "Divya Padukon",
            ),
            const ContactInformationWidget(
              label: "Date",
              value: "12/03 to 19/03",
            ),
            const ContactInformationWidget(
              label: "Time",
              value: "Morning (9 to 12)",
            ),
            const ContactInformationWidget(
              label: "Service",
              value: "Baby Sitting",
            ),
            const ContactInformationWidget(
              label: "Contact Information",
              value: "+91 9876543211",
            ),
            const Spacer(),
            GradientButton(text: "Continue Browsing", onPressed: () {
              Navigator.pushNamed(context, "/browseMaidMainScreen");
            }),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
