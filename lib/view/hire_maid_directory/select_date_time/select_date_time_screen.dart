import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/select_maid/select_maid-screen.dart';
import 'package:wear_work/view/hire_maid_directory/transaction_success_screen/transaction_success_screen.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

import '../../maid_regestration/successful_mail_submission_screeen/success_form_submission.dart';

class SelectDateAndTime extends StatefulWidget {
  const SelectDateAndTime({super.key});

  @override
  State<SelectDateAndTime> createState() => _SelectDateAndTimeState();
}

class _SelectDateAndTimeState extends State<SelectDateAndTime> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Select Date & time",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Select Duration",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Week",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: TimeEnum.week,
              groupValue: selectedDuration,
              onChanged: (v) {
                setState(() {
                  selectedDuration = v!;
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Half Month",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: TimeEnum.halfMonth,
              groupValue: selectedDuration,
              onChanged: (v) {
                setState(() {
                  selectedDuration = v!;
                });
              },
            ),
            RadioListTile(
              value: TimeEnum.fullMonth,
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Month",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              groupValue: selectedDuration,
              onChanged: (v) {
                setState(() {
                  selectedDuration = v!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BigText(
              text: "Select Starting Date",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                width: 120,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SmallText(
                  text: selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : "Select Date",
                  color: AppColors.white,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            BigText(
              text: "Select Starting Time",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            const SizedBox(height: 10),
            const SizedBox(
              height: 5,
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Morning ( 9-12 PM )",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: WorkingTime.morning,
              groupValue: selectedWorkingTime,
              onChanged: (v) {
                setState(() {
                  selectedWorkingTime = v!;
                });
              },
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Afternoon ( 12-3 PM )",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: WorkingTime.afternoon,
              groupValue: selectedWorkingTime,
              onChanged: (v) {
                setState(() {
                  selectedWorkingTime = v!;
                });
              },
            ),
            RadioListTile(
              value: WorkingTime.evening,
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Evening ( 3-6 PM )",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              groupValue: selectedWorkingTime,
              onChanged: (v) {
                setState(() {
                  selectedWorkingTime = v!;
                });
              },
            ),
            const Spacer(),
            GradientButton(
              text: "Continue",
              onPressed: () {
                log(selectedWorkingTime.toString());
                log(selectedDate.toString());
                log(selectedDuration.toString());
                currentUserType == UserType.Hiring
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectMaidScreen(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MaidRegestrationSuccessScreen()));
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
