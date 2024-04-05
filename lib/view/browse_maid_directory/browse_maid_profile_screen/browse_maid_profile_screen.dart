import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/auth/firebase_auth.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/small_text.dart';

class BrowseMaidProfileScreen extends StatefulWidget {
  const BrowseMaidProfileScreen({super.key});

  @override
  State<BrowseMaidProfileScreen> createState() =>
      _BrowseMaidProfileScreenState();
}

class _BrowseMaidProfileScreenState extends State<BrowseMaidProfileScreen> {
  String _selectedValue = '1';
  AuthRepository authRepository = AuthRepository();
   String _userName = '';
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> fetchUserName() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userSnapshot =
      await _firebaseFirestore.collection('users').doc(uid).get();
      setState(() {
        _userName = userSnapshot['userName'];
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }


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
                        text: _userName ?? 'sas',
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
                  IconButton(
                    onPressed: () async {
                      final value = await showMenu<String>(
                        context: context,
                        position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                        items: [
                          buildPopupMenuItem(
                            icon: CupertinoIcons.person,
                            text: "Edit Profile",
                            onTap: () => Navigator.pushNamed(
                                context, "/editProfileScreen"),
                          ),
                          buildPopupMenuItem(
                            icon: CupertinoIcons.lock,
                            text: "Change Password",
                            onTap: () => Navigator.pushNamed(
                                context, "/changePasswordScreen"),
                          ),
                          buildPopupMenuItem(
                            icon: Icons.help_outline,
                            text: "Help And Support",
                            onTap: () =>
                                Navigator.pushNamed(context, "/helpDiskScreen"),
                          ),
                          buildPopupMenuItem(
                            icon: Icons.menu,
                            text: "Main Menu",
                            onTap: () =>  Navigator.pushNamed(context, "/jobTypeScreen"),
                          ),
                          buildPopupMenuItem(
                            icon: Icons.logout,
                            text: "Logout",
                            onTap: () => authRepository.signOut(context),
                          ),
                        ],
                      );
                      if (value != null) {
                        setState(() {
                          _selectedValue = value;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.mainColor,
                    ),
                  ),
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
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
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
    super.key,
    required this.count,
    required this.label,
  });

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

PopupMenuItem<String> buildPopupMenuItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return PopupMenuItem(
    value: text,
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.mainColor,
          ),
          const SizedBox(width: 10),
          SmallText(
            text: text,
            size: 18,
            color: AppColors.mainBlackColor,
          ),
        ],
      ),
    ),
  );
}
