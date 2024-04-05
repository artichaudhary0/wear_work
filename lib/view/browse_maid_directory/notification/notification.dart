import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/small_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Notification",
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFf3fdfe),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF9DF6FF),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Today",
                    color: AppColors.mainBlackColor,
                    fontWeight: FontWeight.w500,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Mahek Patel",
                                color: AppColors.mainBlackColor,
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                              BigText(
                                text: " liked your photo",
                                color: AppColors.mainBlackColor,
                                size: 16,
                              ),
                            ],
                          ),
                          SmallText(
                            text: "20 min",
                            color: AppColors.mainBlackColor,
                            size: 14,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage("assets/images/maid/maid3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Mahek Patel",
                                color: AppColors.mainBlackColor,
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                              BigText(
                                text: " liked your photo",
                                color: AppColors.mainBlackColor,
                                size: 16,
                              ),
                            ],
                          ),
                          SmallText(
                            text: "20 min",
                            color: AppColors.mainBlackColor,
                            size: 14,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage("assets/images/maid/maid3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
