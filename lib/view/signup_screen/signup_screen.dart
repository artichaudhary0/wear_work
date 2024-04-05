import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wear_work/auth/firebase_auth.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/extension.dart';
import 'package:wear_work/view/login_screen/login_screen.dart';
import 'package:wear_work/view/splash_screen/splash_screen.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/custom_textfield.dart';
import 'package:wear_work/widgets/small_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  Uint8List? _pickedProfileImage;
  bool _isLoading = false;
  void selectProfileImage() async {
    Uint8List pickedImagePath =
        await AppExtension.pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedProfileImage = pickedImagePath;
      });
    }
  }

  void signUpMethod() async {
    try {
      setState(() {
        _isLoading = true;
      });
      String res = await AuthMethods().signUpUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        username: usernameController.text.trim(),
        bio: 'arti',
        file: _pickedProfileImage!,
      );
      setState(() {
        _isLoading = false;
      });

      if (res != 'success') {
        AppExtension.snackBar(context, res);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
    } catch (error) {
      AppExtension.snackBar(context, error.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  void navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  AuthMethods authRepository = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/app_main/mesh_border.png"),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: BigText(
                    text: "Sign Up",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        _pickedProfileImage != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(
                                  _pickedProfileImage!,
                                ),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    AssetImage("assets/app_icons/profile2.png"),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightBlue),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: selectProfileImage,
                              icon: const Icon(
                                color: AppColors.white,
                                Icons.edit,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: usernameController,
                      hintText: "User name",
                      prefixImage: "assets/app_icons/account_icon.png",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email Address",
                      prefixImage: "assets/app_icons/mail_icon.png",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      prefixImage: "assets/app_icons/password.png",
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: cpasswordController,
                      hintText: "Confirm Password",
                      prefixImage: "assets/app_icons/password.png",
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : GradientButton(
                            text: "Sign Up",
                            onPressed: signUpMethod,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.borderColor,
                            thickness: 1,
                            indent: 50,
                            endIndent: 10,
                          ),
                        ),
                        SmallText(
                          text: "OR",
                          size: 12,
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.borderColor,
                            thickness: 1,
                            indent: 10,
                            endIndent: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.borderColor,
                        ),
                        children: [
                          const TextSpan(
                            text: "Already have an account?",
                          ),
                          TextSpan(
                            text: "  Log in",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                                // Navigator.pushNamed(context, "/loginScreen");
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
