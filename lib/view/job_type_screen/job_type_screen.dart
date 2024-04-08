import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_work/controller/provider.dart';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/global_values.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid.dart';
import 'package:wear_work/view/job_type_screen/widget/jobtype_tile.dart';
import 'package:wear_work/widgets/big_text.dart';

class JobTypeScreen extends StatefulWidget {
  const JobTypeScreen({super.key});

  @override
  State<JobTypeScreen> createState() => _JobTypeScreenState();
}

class _JobTypeScreenState extends State<JobTypeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    addData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "What Are You ",
                        fontWeight: FontWeight.w700,
                      ),
                      BigText(
                        text: "Looking For? ",
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FadeTransition(
              opacity: _animation,
              child: JobTypeTile(
                imagePath: "assets/images/app_main/cleaning supplies.png",
                title: "Looking For A Job ?",
                onTap: () {
                  Navigator.pushNamed(context, "/maidRegistrationScreen");
                  currentUserType = UserType.Registration;
                  print(currentUserType);
                },
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: JobTypeTile(
                imagePath: "assets/images/app_main/hire_maid.png",
                title: "Hire Maid",
                onTap: () {
                  Navigator.pushNamed(context, "/hireMaidScreen");
                  currentUserType = UserType.Hiring;
                  print(currentUserType);
                },
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: JobTypeTile(
                imagePath: "assets/images/app_main/blue binoculars.png",
                title: "Browse Maid",
                onTap: () {
                  Navigator.pushNamed(context, "/browseMaidMainScreen");
                  currentUserType = UserType.Browsing;
                  print(currentUserType);
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/app_main/meshGradientSecond.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
