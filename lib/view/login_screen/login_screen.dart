import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wear_work/auth/firebase_auth.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/job_type_screen/job_type_screen.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/custom_textfield.dart';
import 'package:wear_work/widgets/small_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/app_main/mesh_border.png"),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: BigText(
                    text: "Log In",
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
                    const SizedBox(
                      height: 20,
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
                    GradientButton(
                      text: "Log In",
                      onPressed: () {
                        authRepository.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(
                                  () {
                                    isChecked = value!;
                                  },
                                );
                              },
                            ),
                            SmallText(
                              text: "Remember me",
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, "/forgetPasswordScreen");
                          },
                          child: SmallText(
                            text: "Forget Password",
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF00A1FF),
                          ),
                        ),
                      ],
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
                    GradientButton(
                      text: "Sign Up With Google",
                      onPressed: () {},
                      imageWidget: Container(
                        height: 16,
                        width: 16,
                        child: Image.asset(
                          "assets/app_icons/icons8-apple-60.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      gradientEndColor: const Color(0xFFf3fdfe),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      gradientStartColor: const Color(0xFFf3fdfe),
                      textColor: AppColors.mainColor,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    GradientButton(
                      text: "Sign Up With Apple",
                      onPressed: () {},
                      imageWidget: SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset(
                          "assets/app_icons/icons8-apple-60.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      gradientEndColor: const Color(0xFFf3fdfe),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      gradientStartColor: const Color(0xFFf3fdfe),
                      textColor: AppColors.mainColor,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
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
                            text: "Don’t Have an Account?",
                          ),
                          TextSpan(
                            text: " Sign Up",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>JobTypeScreen()));
                                // Navigator.pushNamed(context, "/signUpScreen");
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
