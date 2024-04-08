import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/signup_screen/signup_screen.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: AppColors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FadeTransition(
                opacity: _imageAnimation,
                child: Container(
                  height: 230,
                  width: 230,
                  margin: const EdgeInsets.only(top: 140),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/app_main/Mesh gradient3.png"),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: FadeTransition(
                opacity: _buttonAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 390,
                      width: 280,
                      decoration: const BoxDecoration(),
                      child: FadeTransition(
                        opacity: _imageAnimation,
                        child:
                            Image.asset("assets/images/app_main/app_image.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    BigText(
                      text: "Welcome to WearWork",
                      size: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    BigText(
                      text: "Where Clean Starts Here!",
                      size: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: FadeTransition(
                        opacity: _buttonAnimation,
                        child: GradientButton(
                          text: "Get Started",
                          onPressed: () {
                            _navigateToSignUpScreen(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const SignUpScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
