
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_button.dart';
import 'package:wear_work/widgets/small_text.dart';

class MaidDetailScreen extends StatefulWidget {
  String profileImage;
  String name;
  String location;
  int price;
  MaidDetailScreen({
    super.key,
    required this.profileImage,
    required this.name,
    required this.location,
    required this.price,
  });

  @override
  State<MaidDetailScreen> createState() => _MaidDetailScreenState();
}

class _MaidDetailScreenState extends State<MaidDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
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
        title: BigText(
          text: "Maid Summary",
          size: 26,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10,
                              ),
                              child: SmallText(
                                text: "Date",
                                color: AppColors.mainBlackColor,
                                fontWeight: FontWeight.w600,
                                size: 16,
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 154.02,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.lightBlue,
                              ),
                            ),
                            child: SmallText(
                              text: "12/03 to 19/03",
                              color: AppColors.lightBlue,
                              fontWeight: FontWeight.w600,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 120,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10,
                              ),
                              child: SmallText(
                                text: "Time",
                                color: AppColors.mainBlackColor,
                                fontWeight: FontWeight.w600,
                                size: 16,
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 154.02,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.lightBlue,
                              ),
                            ),
                            child: SmallText(
                              text: "Morning ( 9 To 12 )",
                              color: AppColors.lightBlue,
                              fontWeight: FontWeight.w600,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BigText(
              text: "Maid",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 112,
                      width: 112,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.mainBlackColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          widget.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: widget.name,
                          color: AppColors.mainBlackColor,
                          size: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: AppColors.lightBlue,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SmallText(
                              text: widget.location,
                              color: AppColors.mainBlackColor,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Price ",
                              color: AppColors.mainBlackColor,
                              size: 16,
                            ),
                            SmallText(
                              text: " ${widget.price} ₹ / Day ",
                              color: AppColors.lightBlue,
                              size: 16,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            BigText(
              text: "Services",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 112,
                      width: 112,
                      margin: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/images/services/baby-sitter.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: "Services",
                          size: 20,
                        ),
                        SmallText(
                          text:
                          "Baby bathing \nChanging diaper \nPotty training \nWashing clothes of baby",
                          color: AppColors.mainBlackColor,
                          size: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              BigText(
                text: "Address",
                fontWeight: FontWeight.w600,
                size: 24,
              ),
              Container(
                height: 24,
                width: 85,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(8)),
                child: SmallText(
                  text: "Change",
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  size: 12,
                ),
              ),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              width: 215,
              child: SmallText(
                text:
                '''33, Plot 52, Vrundavan Complex, \nKhanda Colony, Panvel, \nNavi Mumbai''',
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
                size: 16,
              ),
            ),
            const SizedBox(height: 10),
            BigText(
              text: "Services",
              fontWeight: FontWeight.w600,
              size: 24,
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                SmallText(
                  text: "Price ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: " ${widget.price} ₹",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SmallText(
                  text: "Duration ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: "7 Days",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SmallText(
                  text: "Discount ",
                  color: Colors.grey.shade800,
                  size: 16,
                ),
                const Spacer(),
                SmallText(
                  text: "5%",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Row(
              children: [
                SmallText(
                  text: "Total ",
                  color: AppColors.mainColor,
                  size: 20,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                SmallText(
                  text: "1330 ₹",
                  color: AppColors.mainBlackColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 20),
            GradientButton(
                text: "Continue To Payment",
                onPressed: () {
                  Navigator.pushNamed(context, "/paymentScreen");
                }),
          ],
        ),
      ),
    );
  }
}
