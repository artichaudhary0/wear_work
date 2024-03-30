import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';


class BabyCareScreen extends StatefulWidget {
  const BabyCareScreen({super.key});

  @override
  State<BabyCareScreen> createState() => _BabyCareScreenState();
}

class _BabyCareScreenState extends State<BabyCareScreen> {
  final List<Map<String, dynamic>> babyTilesData = [
    {
      'imagePath': 'assets/images/baby/baby bathing.png',
      'serviceType': 'Baby Bathing',
    },
    {
      'imagePath': 'assets/images/baby/baby massage.png',
      'serviceType': 'Baby Massage',
    },
    {
      'imagePath': 'assets/images/baby/changing diaper.png',
      'serviceType': 'Changing Diaper',
    },
    {
      'imagePath': 'assets/images/baby/potty training.png',
      'serviceType': 'Potty Training',
    },
    {
      'imagePath': 'assets/images/baby/cleaing baby utensil.png',
      'serviceType': 'Cleaning Baby Utensil',
    },
    {
      'imagePath': 'assets/images/baby/baby food.png',
      'serviceType': 'Baby Food',
    },{
      'imagePath': 'assets/images/baby/washing baby cloth.png',
      'serviceType': 'Washing Baby Cloth',
    },{
      'imagePath': 'assets/images/baby/baby feeding.png',
      'serviceType': 'Baby Feeding',
    },{
      'imagePath': 'assets/images/baby/baby walk.png',
      'serviceType': 'Baby Walk',
    },
  ];
  Map<String, bool> selectedTiles = {};
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
      body:Padding(
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
            const SearchFilterRow(
              title: 'Age',
              ageRange: "20 to 300",
            ),
            const SearchFilterRow(
              title: 'Gender',
              ageRange: "Female",
            ),
            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: babyTilesData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> tileData = babyTilesData[index];
                  final String imagePath = tileData['imagePath'];
                  final String foodType = tileData['serviceType'];
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
