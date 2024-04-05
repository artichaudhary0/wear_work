import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_work/auth/firestore.dart';
import 'package:wear_work/model/user_model.dart' as model;
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/utils/extension.dart';
import 'package:wear_work/widgets/like_animation.dart';
import 'package:wear_work/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../../../../controller/provider.dart';
import '../../comment_screen/comment_screen.dart';

class UserCard extends StatefulWidget {
  final snap;

  const UserCard({
    required this.snap,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool isLikeAnimating = false;
  int commentLen = 0;
  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      AppExtension.snackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }
  deletePost(String postId) async {
    try {
      await FirebaseMethod().deletePost(postId);
    } catch (err) {
      AppExtension.snackBar(
        context,
        err.toString(),
      );
    }
  }
  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  @override
  Widget build(BuildContext context) {
    final model.UsersModel user = Provider.of<UserProvider>(context).getUser;
    return Container(
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.snap['profileImage']),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: widget.snap['username'],
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                    SmallText(
                      text: DateFormat.yMMMd().format(
                        widget.snap['datePublish'].toDate(),
                      ),
                      // text: snap['datePublish'],
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w400,
                      size: 12,
                    ),
                  ],
                ),
                Spacer(),
                widget.snap['uid'].toString() == user.uid
                    ? IconButton(
                  onPressed: () {
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16),
                              shrinkWrap: true,
                              children: [
                                'Delete',
                              ]
                                  .map(
                                    (e) => InkWell(
                                    child: Container(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16),
                                      child: Text(e),
                                    ),
                                    onTap: () {
                                      deletePost(
                                        widget.snap['postId']
                                            .toString(),
                                      );
                                      // remove the dialog box
                                      Navigator.of(context).pop();
                                    }),
                              )
                                  .toList()),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                )
                    : Container(),

              ],
            ),
          ),
          // Container(
          //   height: 303.0,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(widget.snap['photoUrl']),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          GestureDetector(
            onDoubleTap: () {
              FirebaseMethod().likePost(
                widget.snap['postId'].toString(),
                user.uid,
                widget.snap['likes'],
              );
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    widget.snap['photoUrl'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LikeAnimation(
                isAnimating: widget.snap['likes'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['likes'].contains(user.uid)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                  onPressed: () => FirebaseMethod().likePost(
                    widget.snap['postId'].toString(),
                    user.uid,
                    widget.snap['likes'],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(
                      postId: widget.snap['postId'].toString(),
                    ),
                  ),
                ),
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.mainColor,
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.person,
                  color: AppColors.mainColor,
                  size: 28,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SmallText(
              text: '${widget.snap['likes'].length}',
              color: AppColors.mainBlackColor,
              fontWeight: FontWeight.w400,
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(
                  text: widget.snap['username'],
                  color: AppColors.mainBlackColor,
                  fontWeight: FontWeight.w600,
                  size: 16,
                ),
                SizedBox(
                  width: 10,
                ),
                SmallText(
                  text: "#25214",
                  color: AppColors.mainBlackColor,
                  fontWeight: FontWeight.w400,
                  size: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: widget.snap['description'],
                  color: AppColors.mainBlackColor,
                  fontWeight: FontWeight.w400,
                  size: 14,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
