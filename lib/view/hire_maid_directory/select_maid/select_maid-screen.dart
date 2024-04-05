import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/hire_maid_directory/select_maid/widgets/maid_tile.dart';
import 'package:wear_work/view/hire_maid_directory/select_maid/widgets/maid_tile_details_screen.dart';
import 'package:wear_work/widgets/custom_appbar.dart';

class SelectMaidScreen extends StatefulWidget {
  const SelectMaidScreen({super.key});

  @override
  State<SelectMaidScreen> createState() => _SelectMaidScreenState();
}

class _SelectMaidScreenState extends State<SelectMaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Select Maid",
        leading: IconButton(
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
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> userMap =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MaidDetailScreen(
                                    profileImage:
                                        "assets/images/maid/maid 1.png",
                                    name: "jcj",
                                    location: "Mathura",
                                    price: 200,
                                  ),
                                ),
                              );
                            },
                            child: MaidListItem(
                              imageUrl: "assets/images/maid/maid 1.png",
                              rating: 5,
                              numReviews: 111,
                              maidName: userMap["userName"],
                              location: "mathura",
                              age: 22,
                              price: 123,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text("No Data!!!");
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
