import 'package:flutter/material.dart';
import 'package:wear_work/widgets/custom_appbar.dart';

import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';
import '../cooking_service_screen/widgets/food_type_tile.dart';

class SelectDateAndTime extends StatefulWidget {
  const SelectDateAndTime({super.key});

  @override
  State<SelectDateAndTime> createState() => _SelectDateAndTimeState();
}

class _SelectDateAndTimeState extends State<SelectDateAndTime> {
  TimeEnum? selectedFood = TimeEnum.week;
  WorkingTime? selectedWorkingTime = WorkingTime.morning;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppBar(
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
              groupValue: selectedFood,
              onChanged: (v) {
                setState(() {
                  selectedFood = v!;
                });
              },
            ),RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Half Month",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: TimeEnum.halfMonth,
              groupValue: selectedFood,
              onChanged: (v) {
                setState(() {
                  selectedFood = v!;
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
                groupValue: selectedFood,
                onChanged: (v) {
                  setState(() {
                    selectedFood = v!;
                  });
                }),

            const SizedBox(
              height: 10,
            ),
            BigText(
              text: "Select Starting Date",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            Container(
              width: 120,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(24)),
              child: SmallText(
                text: "12/04/2024",
                color: AppColors.white,
                size: 14,
                fontWeight: FontWeight.w400,

              ),
            ),
            BigText(
              text: "Select Starting Date",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            SizedBox(height: 10,),
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
            ),RadioListTile(
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
                }),


            const Spacer(),
            GradientButton(text: "Continue", onPressed: () {
              Navigator.pushNamed(context, "/selectMaidScreen");
            }),
            const SizedBox(
              height: 40,
            ),
          ]
        ),
      ),
    );
  }
}
