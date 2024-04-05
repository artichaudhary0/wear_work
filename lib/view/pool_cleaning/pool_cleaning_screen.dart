import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';

class PoolCleaningServiceScreen extends StatefulWidget {
  const PoolCleaningServiceScreen({super.key});

  @override
  State<PoolCleaningServiceScreen> createState() =>
      _PoolCleaningServiceScreenState();
}

class _PoolCleaningServiceScreenState extends State<PoolCleaningServiceScreen> {
  final List<Map<String, dynamic>> foodTilesData = [
    {
      'imagePath': 'assets/images/pool_cleaning/basic pool cleaning.png',
      'foodType': 'Basic Pool Cleaning',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/vaccumming.png',
      'foodType': 'Vaccumming',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/dribs.png',
      'foodType': 'Skimming Debris',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/brushing tiles pool.png',
      'foodType': 'Brushing Walls And Tiles',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/chemical cleaning.png',
      'foodType': 'Chemical Balancing',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/filter cleaning.png',
      'foodType': 'Filter Cleaning',
    },
    {
      'imagePath': 'assets/images/pool_cleaning/water testing and treatment.png',
      'foodType': 'water testing and treatment',
    },
  ];
  Map<String, bool> selectedTiles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:   CustomAppBar(
        title: "Pool Cleaning",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SearchFilterRow(
              title: 'Size of Pool',
              initialValue: 'Medium', // Initial gender
              options: ['Small', 'Medium', 'Large'], // Gender options
            ),
            BigText(
              text: "Services",
              size: 28,
              fontWeight: FontWeight.w700,
            ),
            const Divider(),
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
            GradientButton(text: "Continue", onPressed: () {
              Navigator.pushNamed(context, "/selectDateAndTimeScreen");
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
