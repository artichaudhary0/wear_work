import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title;
  bool isSelected = false;
  CustomSwitchTile({required this.isSelected, required this.title});

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SmallText(
        text: widget.title,
        size: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.mainBlackColor,
      ),
      Switch(
        thumbIcon: thumbIcon,
        value: widget.isSelected,
        onChanged: (bool value) {
          setState(() {
            widget.isSelected = value;
          });
        },
      )
    ]);
  }
}
