
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/meal-tile.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

import '../../widgets/small_text.dart';

class ElderCareScreen extends StatefulWidget {
  const ElderCareScreen({super.key});

  @override
  State<ElderCareScreen> createState() => _ElderCareScreenState();
}

class _ElderCareScreenState extends State<ElderCareScreen> {
  BedRidden? selectedFood = BedRidden.yes;
  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  final List<Map<String, dynamic>> foodTilesData = [
    {
      'imagePath': 'assets/images/elder_care/bathing elder.png',
      'foodType': 'bathing and sponging',
    }, {
      'imagePath': 'assets/images/elder_care/cleaning utensil elder.png',
      'foodType': 'Cleaning Utensil Of Elderly',
    }, {
      'imagePath': 'assets/images/elder_care/cooking elder.png',
      'foodType': 'Cooking For Elderly',
    }, {
      'imagePath': 'assets/images/elder_care/diaper change.png',
      'foodType': 'Diaper Change',
    }, {
      'imagePath': 'assets/images/elder_care/feeding elder.png',
      'foodType': 'Feeding',
    }, {
      'imagePath': 'assets/images/elder_care/nursing elder.png',
      'foodType': 'Giving Medicine',
    }, {
      'imagePath': 'assets/images/elder_care/injection elder.png',
      'foodType': 'Injections',
    }, {
      'imagePath': 'assets/images/elder_care/massage elder.png',
      'foodType': 'Massage',
    }, {
      'imagePath': 'assets/images/elder_care/taking walk elder.png',
      'foodType': 'Taking Elderly For A Walk',
    },

  ];
  Map<String, bool> selectedTiles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: AppColors.mainColor,
            ),
          ),
        ),
        title: BigText(
          text: "Elder Care",
          size: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchFilterRow(
              title: 'Age',
              ageRange: "65 Yr",
            ),
            const SearchFilterRow(
              title: 'Gender',
              ageRange: "Female",
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
              groupValue: selectedFood,
              onChanged: (v) {
                setState(() {
                  selectedFood = v!;
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
                itemCount: foodTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData = foodTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['foodType'];
                  final isSelected = selectedTiles.containsKey(foodType)
                      ? selectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedTiles[foodType] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            // const Spacer(),
            GradientButton(text: "Continue", onPressed: () {}),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
