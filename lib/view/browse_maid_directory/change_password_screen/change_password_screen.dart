import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/custom_textfield.dart';
import 'package:wear_work/widgets/small_text.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final cPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Change Password",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: oldPasswordController,
              prefixImage: "assets/app_icons/password.png",
              hintText: "Old Password",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: oldPasswordController,
              prefixImage: "assets/app_icons/password.png",
              hintText: "New Password",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: oldPasswordController,
              prefixImage: "assets/app_icons/password.png",
              hintText: "Confirm Password",
            ),
            const SizedBox(
              height: 20,
            ),
            SmallText(
              text: "Forget Password ?",
              color: AppColors.mainColor,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            GradientButton(
              text: "Update Password",
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
