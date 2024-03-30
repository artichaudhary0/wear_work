import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final bool centerTitle;
  final Color backgroundColor;
  final Color iconColor;
  final double titleSize;
  final FontWeight titleFontWeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading = const SizedBox(),
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.iconColor = const Color(0xFF04009A),
    this.titleSize = 28,
    this.titleFontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: leading,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: titleSize,
          fontWeight: titleFontWeight,
          color: AppColors.mainColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

