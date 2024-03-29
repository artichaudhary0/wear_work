import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/cooking_service_screen/widgets/food_type_tile.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

class EventCleaningServiceScreen extends StatefulWidget {
  const EventCleaningServiceScreen({super.key});

  @override
  State<EventCleaningServiceScreen> createState() =>
      _EventCleaningServiceScreenState();
}

class _EventCleaningServiceScreenState
    extends State<EventCleaningServiceScreen> {
  final List<Map<String, dynamic>> foodTilesData = [
    {
      'imagePath': 'assets/images/event_cleaning/general cleaning.png',
      'foodType': 'General Cleaning',
    },
    {
      'imagePath': 'assets/images/event_cleaning/trash removal.png',
      'foodType': 'Trash Removal',
    },
    {
      'imagePath': 'assets/images/event_cleaning/bathroom cleaning.png',
      'foodType': 'Bathroom Cleaning',
    },
    {
      'imagePath': 'assets/images/event_cleaning/room cleaning.png',
      'foodType': 'Kitchen Area Cleaning',
    },
    {
      'imagePath': 'assets/images/event_cleaning/decoration cleaning.png',
      'foodType': 'Decoration Cleaning',
    },
    {
      'imagePath': 'assets/images/event_cleaning/furniture arrangement.png',
      'foodType': 'Furniture Arrangement.png',
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
          text: "Event Cleaning",
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
