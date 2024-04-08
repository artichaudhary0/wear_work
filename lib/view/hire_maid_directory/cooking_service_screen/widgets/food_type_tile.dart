import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class FoodTypeTile extends StatelessWidget {
  String imagePath;
  bool isSelected;
  String foodType;

  final Function(bool?) onChanged;
  FoodTypeTile({
    super.key,
    required this.isSelected,
    required this.imagePath,
    required this.foodType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: foodType,
              size: 16,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            Checkbox(
              value: isSelected,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
