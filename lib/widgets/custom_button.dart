import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final VoidCallback onPressed;
  final Border? border;
  final Widget? imageWidget;

  const GradientButton({
    super.key,
    required this.text,
    this.width,
    this.imageWidget,
    this.height,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.textColor = Colors.white,
    this.gradientStartColor = const Color(0xFF0600FF),
    this.gradientEndColor = const Color(0xFF0395FF),
    this.border,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: border,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [gradientStartColor, gradientEndColor],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageWidget != null) ...[
              imageWidget!,
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
