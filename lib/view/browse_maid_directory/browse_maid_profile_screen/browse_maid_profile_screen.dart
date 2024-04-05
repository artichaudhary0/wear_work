import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_work/auth/firebase_auth.dart';
import 'package:wear_work/auth/firestore.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/small_text.dart';

import '../../../controller/provider.dart';
import '../../../model/user_model.dart' as model;
import '../../login_screen/login_screen.dart';

class BrowseMaidProfileScreen extends StatefulWidget {
  String? uid;
  BrowseMaidProfileScreen({super.key, this.uid});

  @override
  State<BrowseMaidProfileScreen> createState() =>
      _BrowseMaidProfileScreenState();
}

class _BrowseMaidProfileScreenState extends State<BrowseMaidProfileScreen> {
  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      // AppExtension.snackBar(
      //   context,
      //   e.toString(),
      // );
    }
    setState(() {
      isLoading = false;
    });
  }

  String _selectedValue = '1';
  AuthMethods authRepository = AuthMethods();
  String _userName = '';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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
    model.UsersModel usersModel = Provider.of<UserProvider>(context).getUser;
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(usersModel!.photoUrl),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: usersModel.username ?? 'sas',
                        color: AppColors.mainBlackColor,
                        fontWeight: FontWeight.w500,
                        size: 20,
                      ),
                      BigText(
                        text: usersModel.bio,
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
                            onTap: () =>
                                Navigator.pushNamed(context, "/jobTypeScreen"),
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountWidget(count: postLen, label: "Posts"),
                      CountWidget(count: following, label: "Following"),
                      CountWidget(count: followers, label: "Followers"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FirebaseAuth.instance.currentUser!.uid == widget.uid
                        ? OutlinedButton(
                            child: Text('Sign Out'),
                            onPressed: () async {
                              await AuthMethods().signOut;
                              if (context.mounted) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              }
                            },
                          )
                        : isFollowing
                            ? OutlinedButton(
                                child: Text('UnFollow'),
                                onPressed: () async {
                                  await FirebaseMethod().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['uid'],
                                  );

                                  setState(() {
                                    isFollowing = false;
                                    followers--;
                                  });
                                },
                              )
                            : OutlinedButton(
                                child: Text('Follow'),
                                onPressed: () async {
                                  await FirebaseMethod().followUser(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    userData['uid'],
                                  );

                                  setState(() {
                                    isFollowing = true;
                                    followers++;
                                  });
                                },
                              )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('posts')
                  .where('uid', isEqualTo: widget.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 1.5,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    DocumentSnapshot snap =
                        (snapshot.data! as dynamic).docs[index];

                    return SizedBox(
                      child: Image(
                        image: NetworkImage(snap['photoUrl']),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ),
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
