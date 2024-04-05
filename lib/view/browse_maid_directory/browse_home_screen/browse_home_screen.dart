import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid/widget/posts_card.dart';
import 'package:wear_work/view/browse_maid_directory/notification/notification.dart';
import 'package:wear_work/widgets/big_text.dart';

import '../../../model/post_model.dart';

class BrowseMaidHomeScreen extends StatelessWidget {
  const BrowseMaidHomeScreen({super.key});

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
                )),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshots.data!.docs.length,
              itemBuilder: (context, index) {
                return UserCard(
                  snap: snapshots.data!.docs[index].data(),
                );
              });
        },
      ),
      // body: ListView(
      //   children: [
      //     UserCard(
      //       name: 'Jatin Solanki',
      //       id: '#25214',
      //       imageUrl: 'assets/images/maid/maid3.png',
      //       message: 'Hey all! How are you? How was your day going?',
      //       onHeartPressed: () {},
      //       onChatPressed: () {},
      //       onPersonPressed: () {},
      //     ),
      //     UserCard(
      //       name: 'Jatin Solanki',
      //       id: '#25214',
      //       imageUrl: 'assets/images/maid/maid3.png',
      //       message: 'Hey all! How are you? How was your day going?',
      //       onHeartPressed: () {},
      //       onChatPressed: () {},
      //       onPersonPressed: () {},
      //     ),
      //     UserCard(
      //       name: 'Jatin Solanki',
      //       id: '#25214',
      //       imageUrl: 'assets/images/maid/maid3.png',
      //       message: 'Hey all! How are you? How was your day going?',
      //       onHeartPressed: () {},
      //       onChatPressed: () {},
      //       onPersonPressed: () {},
      //     ),
      //   ],
      // ),
    );
  }
}
