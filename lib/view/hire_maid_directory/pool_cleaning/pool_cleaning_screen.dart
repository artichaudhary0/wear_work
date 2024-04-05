import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid/widget/search_filter.dart';
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
  AppLists poolTileList = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
                itemCount: poolTileList.poolTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData =
                      poolTileList.poolTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['foodType'];
                  final isSelected = poolSelectedTiles.containsKey(foodType)
                      ? poolSelectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        poolSelectedTiles[foodType] = value ?? false;
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
