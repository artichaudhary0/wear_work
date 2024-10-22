import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class VehicleWashingScreen extends StatefulWidget {
  const VehicleWashingScreen({super.key});

  @override
  State<VehicleWashingScreen> createState() => _VehicleWashingScreenState();
}

class _VehicleWashingScreenState extends State<VehicleWashingScreen> {
  VehicleType? selectedFood = VehicleType.twoVehicle;

  AppLists vehicleTilesData = AppLists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Vehicle Washing",
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
                itemCount: vehicleTilesData.vehicleTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData =
                      vehicleTilesData.vehicleTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['foodType'];
                  final isSelected = vehicleSelectedTiles.containsKey(foodType)
                      ? vehicleSelectedTiles[foodType]!
                      : false;

                  return FoodTypeTile(
                    imagePath: imagePath,
                    foodType: foodType,
                    isSelected: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        vehicleSelectedTiles[foodType] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            GradientButton(
                text: "Continue",
                onPressed: () {
                  print(selectedWorkingTime);
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
