import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

import '../../widgets/small_text.dart';

class VehicleWashingScreen extends StatefulWidget {
  const VehicleWashingScreen({super.key});

  @override
  State<VehicleWashingScreen> createState() => _VehicleWashingScreenState();
}

class _VehicleWashingScreenState extends State<VehicleWashingScreen> {
  VehicleType? selectedFood = VehicleType.twoVehicle;

  final List<Map<String, dynamic>> foodTilesData = [
    {
      'imagePath': 'assets/images/vehicle_washing/basic v wash.png',
      'foodType': 'Basic Wash',
    },
    {
      'imagePath': 'assets/images/vehicle_washing/premium v wash.png',
      'foodType': 'Premium Wash',
    },
    {
      'imagePath': 'assets/images/vehicle_washing/interior v wash.png',
      'foodType': 'Interior Cleaning',
    },
    {
      'imagePath': 'assets/images/vehicle_washing/exterior v wash.png',
      'foodType': 'Exterior Cleaning',
    },
    {
      'imagePath': 'assets/images/vehicle_washing/exterior interior v wash.png',
      'foodType': 'Full Detailing \n(Interior & Exterior both)',
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
          text: "Vehicle Washing",
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
              text: "Select Vehicle Type",
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            const Divider(),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: SmallText(
                text: "Two Wheeler",
                color: AppColors.mainBlackColor,
                size: 18,
                fontWeight: FontWeight.w400,
              ),
              dense: true,
              value: VehicleType.twoVehicle,
              groupValue: selectedFood,
              onChanged: (v) {
                setState(() {
                  selectedFood = v!;
                });
              },
            ),
            RadioListTile(
                value: VehicleType.fourVehicle,
                contentPadding: EdgeInsets.zero,
                title: SmallText(
                  text: "Four Wheeler",
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
              text: "Types Of Washing",
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
