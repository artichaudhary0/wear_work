import 'package:flutter/widgets.dart';

class SmallText extends StatelessWidget {
  Color? color;
  TextOverflow? overflow;
  final String text;
  double size;
  double height;
  SmallText({
    super.key,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xFFccc7c5),
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
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? 12 : size,
        fontFamily: "Roboto",
        height: height,
      ),
    );
  }
}