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

class BabyCareScreen extends StatefulWidget {
  const BabyCareScreen({Key? key}) : super(key: key);

  @override
  State<BabyCareScreen> createState() => _BabyCareScreenState();
}

class _BabyCareScreenState extends State<BabyCareScreen> {
  AppLists babyTiles = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Baby Sitter",
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
              text: "About Baby",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            SearchFilterRow(
              title: 'Age',
              initialValue: '0-1', // Initial age range
              options: babyTiles.babyAgeOption,
            ),
            SearchFilterRow(
              title: 'Gender',
              initialValue: 'Female', // Initial gender
              options: babyTiles.gender,
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: babyTiles.babyTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData =
                      babyTiles.babyTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['serviceType'];
                  final isSelected = babySelectedTiles.containsKey(foodType)
                      ? babySelectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        babySelectedTiles[foodType] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            GradientButton(
              text: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, "/selectDateAndTimeScreen");
                if (currentUserType == UserType.Hiring) {
                  hiringSelectedTiles.addAll(babySelectedTiles);
                } else if (currentUserType == UserType.Registration) {
                  registrationSelectedTiles.addAll(babySelectedTiles);
                }
                print(babySelectedTiles);
                print(hiringSelectedTiles);
                print(registrationSelectedTiles);
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
