import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                  child: BigText(
                    text: "Location",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/app_main/atomic-delivery-address-1.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  GradientButton(
                    text: "Enable Device Location",
                    onPressed: () {
                      Navigator.pushNamed(context, "/jobTypeScreen");
                    },
                  ),
                  GradientButton(
                    text: "Enter Location Manually",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
