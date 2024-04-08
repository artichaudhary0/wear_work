import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';


class ElderCareScreen extends StatefulWidget {
  const ElderCareScreen({super.key});

  @override
  State<ElderCareScreen> createState() => _ElderCareScreenState();
}

class _ElderCareScreenState extends State<ElderCareScreen> {
  BedRidden? selectedRiddenType = BedRidden.yes;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );


  AppLists elderTileList = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Elder Care",
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
              initialValue: '40-50', // Initial age range
              options: elderTileList.ageOption,
            ),
             SearchFilterRow(
              title: 'Gender',
              initialValue: 'Female', // Initial gender
              options: elderTileList.gender // Gender options
            ),
            BigText(
              text: "Is He/She Bed Ridden?",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Yes",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: BedRidden.yes,
              groupValue: selectedRiddenType,
              onChanged: (v) {
                setState(() {
                  selectedRiddenType = v!;
                });
              },
            ),
            RadioListTile(
                value: BedRidden.no,
                contentPadding: EdgeInsets.zero,
                title: SmallText(
                  text: "No",
                  color: AppColors.mainBlackColor,
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
                dense: true,
                groupValue: selectedRiddenType,
                onChanged: (v) {
                  setState(() {
                    selectedRiddenType = v!;
                  });
                }),

            const SizedBox(
              height: 10,
            ),
            BigText(
              text: "Services",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: elderTileList.elderTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData = elderTileList.elderTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['serviceType'];
                  final isSelected = elderServiceSelectedTiles.containsKey(foodType)
                      ? elderServiceSelectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        elderServiceSelectedTiles[foodType] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            // const Spacer(),
            GradientButton(
              text: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, "/selectDateAndTimeScreen");
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
