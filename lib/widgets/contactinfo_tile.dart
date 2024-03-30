import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class ContactInformationWidget extends StatelessWidget {
  final String label;
  final String value;

  const ContactInformationWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SmallText(
            text: label,
            color: Colors.grey.shade800,
            size: 16,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          SmallText(
            text: value,
            color: AppColors.mainBlackColor,
            size: 14,
          ),
        ],
      ),
    );
  }
}
