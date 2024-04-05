import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class BrowseMaidSearchScreen extends StatelessWidget {
  const BrowseMaidSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: GradientButton(
                    onPressed: () {},
                    text: 'Cancel',
                    height: 40,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            BigText(
              text: "History",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/maid/maid3.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: "Jatin Solanki",
                        fontWeight: FontWeight.w600,
                        size: 16,
                        color: AppColors.mainBlackColor,
                      ),
                      SmallText(
                        text: "#21233",
                        fontWeight: FontWeight.w400,
                        size: 14,
                        color: AppColors.borderColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.dangerous_outlined,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
