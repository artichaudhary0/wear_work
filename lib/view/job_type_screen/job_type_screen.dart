import 'package:flutter/material.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid.dart';
import 'package:wear_work/view/job_type_screen/widget/jobtype_tile.dart';
import 'package:wear_work/widgets/big_text.dart';

class JobTypeScreen extends StatefulWidget {
  const JobTypeScreen({super.key});

  @override
  State<JobTypeScreen> createState() => _JobTypeScreenState();
}

class _JobTypeScreenState extends State<JobTypeScreen> {
  bool isChecked = false;
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
            JobTypeTile(
              imagePath: "assets/images/app_main/cleaning supplies.png",
              title: "Looking For A Job ?",
              onTap: () {
                Navigator.pushNamed(context, "/maidRegistrationScreen");
              },
            ),
            JobTypeTile(
              imagePath: "assets/images/app_main/hire_maid.png",
              title: "Hire Maid",
              onTap: () {
                Navigator.pushNamed(context, "/hireMaidScreen");
              },
            ),
            JobTypeTile(
              imagePath: "assets/images/app_main/blue binoculars.png",
              title: "Browse Maid",
              onTap: () {
                Navigator.pushNamed(context, "/browseMaidMainScreen");
              },
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
    ;
  }
}
