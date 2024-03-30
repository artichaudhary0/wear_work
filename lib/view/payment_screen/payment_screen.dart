import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Payments",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/payment/upi.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 20),
                SmallText(
                  text: "UPI",
                  color: AppColors.mainBlackColor,
                  size: 20,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/payment/VISA.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 20),
                SmallText(
                  text: "Credit/Debit/Atm Card",
                  color: AppColors.mainBlackColor,
                  size: 20,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/payment/other.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 20),
                SmallText(
                  text: "Pay After Service",
                  color: AppColors.mainBlackColor,
                  size: 20,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 230,
                    width: 230,
                    margin: const EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/app_main/Mesh gradient3.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 80,
                  child: Image.asset(
                    "assets/images/app_main/online_payment.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            BigText(
              text: "Payment Detail",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                SmallText(
                  text: "Price ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: " ${200} ₹",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SmallText(
                  text: "Duration ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: "7 Days",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SmallText(
                  text: "Discount ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: "5%",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Row(
              children: [
                SmallText(
                  text: "Total ",
                  color: AppColors.mainColor,
                  size: 20,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                SmallText(
                  text: "1330 ₹",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            SizedBox(height: 40),
            GradientButton(
                text: "Pay  1330 ₹",
                onPressed: () {
                  Navigator.pushNamed(context, "/transactionSuccessScreen");
                }),
          ],
        ),
      ),
    );
  }
}
