import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid/widget/posts_card.dart';
import 'package:wear_work/view/browse_maid_directory/notification/notification.dart';
import 'package:wear_work/widgets/big_text.dart';

import '../../../model/post_model.dart';

class BrowseMaidHomeScreen extends StatelessWidget {
  const BrowseMaidHomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.location_on_rounded,
          color: AppColors.mainColor,
        ),
        title: BigText(
          text: "Amreli Gujarat",
          size: 20,
        ),
        centerTitle: false,
        elevation: 3,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_active,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16.0),
                        // Placeholder for text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 16.0,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                width: double.infinity,
                                height: 16.0,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                width: 100.0,
                                height: 16.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              return UserCard(
                snap: snapshots.data!.docs[index].data(),
              );
            },
          );
        },
      ),
    );
  }
}
