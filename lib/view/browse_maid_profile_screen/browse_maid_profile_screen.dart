import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';

class BrowseMaidProfileScreen extends StatelessWidget {
  const BrowseMaidProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/maid/maid 2.png"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Kavya Padukon",
                        color: AppColors.mainBlackColor,
                        fontWeight: FontWeight.w500,
                        size: 20,
                      ),
                      BigText(
                        text: "#26514",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        size: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: AppColors.mainColor,
                            size: 20,
                          ),
                          BigText(
                            text: "Amreli ",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                          BigText(
                            text: "Gujarat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    color: AppColors.mainColor,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountWidget(count: 8, label: "Posts"),
                  CountWidget(count: 421, label: "Following"),
                  CountWidget(count: 200, label: "Followers"),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurple.shade100,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  final int count;
  final String label;

  const CountWidget({
    Key? key,
    required this.count,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(
            text: count.toString(),
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          BigText(
            text: label,
            color: AppColors.mainBlackColor,
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ],
      ),
    );
  }
}
