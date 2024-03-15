import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  TextOverflow? overflow;
  final String text;
  double size;
  FontWeight fontWeight;
  double height;
  SmallText({
    super.key,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xFFccc7c5),
    this.fontWeight = FontWeight.normal,
    this.size = 0,
    this.height = 1.2,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 100,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size == 0 ? 12 : size,
        fontWeight:
            fontWeight == FontWeight.normal ? FontWeight.normal : fontWeight,
        height: height,
      ),
    );
  }
}
