import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/small_text.dart';

class MaidListItem extends StatelessWidget {
  const MaidListItem({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.numReviews,
    required this.maidName,
    required this.location,
    required this.age,
    required this.price,

  });

  final String imageUrl;
  final double rating;
  final int numReviews;
  final String maidName;
  final String location;
  final int age;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(-3, 3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        color: Color(0xFFF3FDFE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            minRadius: 10,
            maxRadius: 60,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 10),
                    SmallText(
                      text: rating.toString(),
                      color: AppColors.mainBlackColor,
                      size: 16,
                    ),
                    const SizedBox(width: 10),
                    SmallText(
                      text: "($numReviews)",
                      size: 12,
                    ),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.heart,
                      color: AppColors.mainBlackColor,
                    ),
                  ],
                ),
                BigText(
                  text: maidName,
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: AppColors.mainBlackColor,
                ),
                BigText(
                  text: location,
                  size: 16,
                  color: AppColors.mainBlackColor,
                ),
                BigText(
                  text: "$age yrs",
                  size: 16,
                  color: AppColors.mainBlackColor,
                ),
                Row(
                  children: [
                    SmallText(
                      text: "From ",
                      size: 16,
                    ),
                    const Spacer(),
                    BigText(
                      text: "₹ $price",
                      fontWeight: FontWeight.w600,
                      size: 16,
                      color: AppColors.mainBlackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
