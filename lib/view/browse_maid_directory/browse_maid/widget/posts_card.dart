import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageUrl;
  final String message;

  final VoidCallback onHeartPressed;
  final VoidCallback onChatPressed;
  final VoidCallback onPersonPressed;

  const UserCard({
    Key? key,
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.message,

    required this.onHeartPressed,
    required this.onChatPressed,
    required this.onPersonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 473,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(imageUrl),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: name,
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                    SmallText(
                      text: id,
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w400,
                      size: 16,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.mainColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 303.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onHeartPressed,
                icon: Icon(
                  CupertinoIcons.heart,
                  color: AppColors.mainColor,
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: onChatPressed,
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: AppColors.mainColor,
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: onPersonPressed,
                icon: Icon(
                  CupertinoIcons.person,
                  color: AppColors.mainColor,
                  size: 28,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(
                  text: "Jatin Solanki",
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
            child: SmallText(
              text: message,
              color: AppColors.mainBlackColor,
              fontWeight: FontWeight.w400,
              size: 14,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
