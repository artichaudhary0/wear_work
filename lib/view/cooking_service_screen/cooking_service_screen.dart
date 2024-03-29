
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

class CookingServiceScreen extends StatefulWidget {
  const CookingServiceScreen({super.key});

  @override
  State<CookingServiceScreen> createState() => _CookingServiceScreenState();
}

class _CookingServiceScreenState extends State<CookingServiceScreen> {
  FoodType? selectedFood = FoodType.veg;
  bool mealType1 = false;
  bool mealType2 = false;
  bool mealType3 = false;
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
      'imagePath': 'assets/images/cooking/gujarat.png',
      'foodType': 'Gujarati',
    },
    {
      'imagePath': 'assets/images/cooking/punjab.png',
      'foodType': 'Punjab',
    },
    {
      'imagePath': 'assets/images/cooking/south.png',
      'foodType': 'South Indian',
    },
    {
      'imagePath': 'assets/images/cooking/italian.png',
      'foodType': 'italian',
    },
    {
      'imagePath': 'assets/images/cooking/chinese.png',
      'foodType': 'Chinese',
    },
    {
      'imagePath': 'assets/images/cooking/continental.png',
      'foodType': 'Continental',
    },
    {
      'imagePath': 'assets/images/cooking/jain.png',
      'foodType': 'Jain',
    },
    {
      'imagePath': 'assets/images/cooking/basic cook.png',
      'foodType': 'Basic Cook',
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
          text: "Personalize Search!",
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
              ageRange: "20 to 300",
            ),
            const SearchFilterRow(
              title: 'Religion',
              ageRange: "Hindu",
            ),
            BigText(
              text: "Food Selection",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Veg",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: FoodType.veg,
              groupValue: selectedFood,
              onChanged: (v) {
                setState(() {
                  selectedFood = v!;
                });
              },
            ),
            RadioListTile(
                value: FoodType.nonVeg,
                contentPadding: EdgeInsets.zero,
                title: SmallText(
                  text: "Non-Veg",
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
            BigText(
              text: "Meal Selection",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            CustomSwitchTile(
              isSelected: mealType1,
              title: 'Break Fast',
            ),
            CustomSwitchTile(
              isSelected: mealType2,
              title: 'Lunch',
            ),
            CustomSwitchTile(
              isSelected: mealType3,
              title: 'Dinner',
            ),
            const SizedBox(
              height: 10,
            ),
            BigText(
              text: "Cuisines Selection",
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
