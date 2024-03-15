import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  Color? color;
  TextOverflow? overflow;
  final String text;
  double size;
  FontWeight fontWeight;
  double letterSpacing;
  BigText({
    super.key,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xFF04009A),
    this.fontWeight = FontWeight.normal,
    this.size = 0,
    this.letterSpacing = 1,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 20,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size == 0 ? 28 : size,
        fontWeight:
        fontWeight == FontWeight.normal ? FontWeight.normal : fontWeight,
        letterSpacing: letterSpacing == 1 ? 1 : letterSpacing,
      ),
    );
  }
}
