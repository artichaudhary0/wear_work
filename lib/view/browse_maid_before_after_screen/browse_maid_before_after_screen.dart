import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wear_work/widgets/big_text.dart';

import '../../utils/colors.dart';

class BrowseMaidBeforeAfterScreen extends StatelessWidget {
  const BrowseMaidBeforeAfterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Ongoing",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  children: [
                    BigText(
                      text: "Service : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: "Baby Sitter ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BigText(
                      text: "Address : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: " 33, Plot 52, Panvel, Navi Mumbai ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BigText(
                      text: "Date : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: "12/03 ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 133,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3FDFE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF9DF6FF),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          size: 30,
                          color: AppColors.lightBlue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BigText(
                          text: "Before",
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightBlue,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 133,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3FDFE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF9DF6FF),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          size: 30,
                          color: AppColors.lightBlue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BigText(
                          text: "After",
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightBlue,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            BigText(
              text: "History",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  children: [
                    BigText(
                      text: "Service : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: "Baby Sitter ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BigText(
                      text: "Address : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: " 33, Plot 52, Panvel, Navi Mumbai ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BigText(
                      text: "Date : ",
                      fontWeight: FontWeight.w600,
                      size: 14,
                      color: AppColors.mainBlackColor,
                    ),
                    BigText(
                      text: "12/03 ",
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainBlackColor,
                      size: 14,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 133,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3FDFE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF9DF6FF),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          size: 30,
                          color: AppColors.lightBlue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BigText(
                          text: "Before",
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightBlue,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 133,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3FDFE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF9DF6FF),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          size: 30,
                          color: AppColors.lightBlue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BigText(
                          text: "After",
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightBlue,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
