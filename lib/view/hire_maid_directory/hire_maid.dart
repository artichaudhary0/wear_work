import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';

class HireMaidScreen extends StatefulWidget {
  const HireMaidScreen({super.key});

  @override
  State<HireMaidScreen> createState() => _HireMaidScreenState();
}

class _HireMaidScreenState extends State<HireMaidScreen> {
  Gender? selectedGender = Gender.male;
  AppLists optionList = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Personalize Search!",
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
            SearchFilterRow(
              title: 'Age',
              initialValue: '20-30', // Initial age range
              options: optionList.ageOption,
            ),
            SearchFilterRow(
              title: 'Religion',
              initialValue: 'Hindu', // Initial gender
              options: optionList.religion,
            ),
            BigText(
              text: "Gender",
              fontWeight: FontWeight.w600,
            ),
            const Divider(),
            RadioListTile(
                title: const Text("Male"),
                value: Gender.male,
                groupValue: selectedGender,
                onChanged: (v) {
                  setState(() {
                    selectedGender = v!;
                  });
                }),
            RadioListTile(
                title: const Text("Female"),
                value: Gender.female,
                groupValue: selectedGender,
                onChanged: (v) {
                  setState(() {
                    selectedGender = v!;
                  });
                }),
            RadioListTile(
                title: const Text("Others"),
                value: Gender.other,
                groupValue: selectedGender,
                onChanged: (v) {
                  setState(() {
                    selectedGender = v!;
                  });
                }),
            const Spacer(),
            GradientButton(
                text: "Continue",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/selectServiceScreen",
                  );
                }),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
