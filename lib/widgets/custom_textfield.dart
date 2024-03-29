import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wear_work/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String prefixImage;
  final Color hintColor;
  final Color borderColor;
  final double fontSize;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final bool isPassword;
  const CustomTextField({
    super.key,
    this.hintText = "Enter details",
    this.prefixImage = "",
    this.hintColor = Colors.grey,
    this.borderColor = AppColors.borderColor,
    this.fontSize = 18,
    this.contentHorizontalPadding = 10,
    this.contentVerticalPadding = 12,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _isObscure : false,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: widget.fontSize,
        color: widget.hintColor,
      ),
      decoration: InputDecoration(
        prefixIcon: Image.asset(widget.prefixImage),
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentHorizontalPadding,
          vertical: widget.contentVerticalPadding,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.borderColor,
                ),
                onPressed: () {
                  setState(
                    () {
                      _isObscure = !_isObscure;
                    },
                  );
                },
              )
            : null,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: widget.fontSize,
          color: widget.hintColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            color: widget.borderColor,
          ),
        ),
      ),
    );
  }
}
