import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';

class HomeCleaningServiceScreen extends StatefulWidget {
  const HomeCleaningServiceScreen({super.key});

  @override
  State<HomeCleaningServiceScreen> createState() =>
      _HomeCleaningServiceScreenState();
}

class _HomeCleaningServiceScreenState extends State<HomeCleaningServiceScreen> {
  AppLists homeTilesList = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cleaning",
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
              text: "Select Your Needs",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: homeTilesList.homeTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData =
                      homeTilesList.homeTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['serviceType'];
                  final isSelected = homeSelectedTiles.containsKey(foodType)
                      ? homeSelectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        homeSelectedTiles[foodType] = value ?? false;
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
