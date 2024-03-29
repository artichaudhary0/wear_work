import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

class HomeCleaningServiceScreen extends StatefulWidget {
  const HomeCleaningServiceScreen({super.key});

  @override
  State<HomeCleaningServiceScreen> createState() => _HomeCleaningServiceScreenState();
}

class _HomeCleaningServiceScreenState extends State<HomeCleaningServiceScreen> {
  final List<Map<String, dynamic>> foodTilesData = [
    {
      'imagePath': 'assets/images/home_cleaning/bathroom.png',
      'foodType': 'Bathroom Cleaning',
    },
    {
      'imagePath': 'assets/images/home_cleaning/clothe iroing.png',
      'foodType': 'Clothes Ironing',
    },
    {
      'imagePath': 'assets/images/home_cleaning/clothe washing.png',
      'foodType': 'Clothe Washing \n(By Hands)',
    },
    {
      'imagePath': 'assets/images/home_cleaning/clothe washing machine.png',
      'foodType': 'Clothes Washing \n(With Washing Machine)',
    },
    {
      'imagePath': 'assets/images/home_cleaning/floor cleaning.png',
      'foodType': 'Floor Cleaning',
    },
    {
      'imagePath': 'assets/images/home_cleaning/utensil cleaning.png',
      'foodType': 'Utensil Cleanup',
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
          text: "Cleaning",
          size: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Select Your Needs",
              fontWeight: FontWeight.w600,
              size: 20,
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