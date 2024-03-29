
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class SearchFilterRow extends StatelessWidget {
  final String title;
  final String ageRange;
  const SearchFilterRow({
    required this.title,
    super.key, required this.ageRange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: title,
            color: AppColors.mainBlackColor,
            size: 18,
            fontWeight: FontWeight.w400,
          ),
          Container(
            width: 120,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(24)),
            child: SmallText(
              text: ageRange,
              color: AppColors.white,
              size: 14,
              fontWeight: FontWeight.w400,

            ),
          ),
        ],
      ),
    );
  }
}
