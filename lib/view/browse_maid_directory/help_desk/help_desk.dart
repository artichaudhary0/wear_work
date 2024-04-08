import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_list.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';

class HelpDiskScreen extends StatefulWidget {
  const HelpDiskScreen({super.key});

  @override
  State<HelpDiskScreen> createState() => _HelpDiskScreenState();
}

class _HelpDiskScreenState extends State<HelpDiskScreen> {
  AppLists questionList = AppLists();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Help & Support",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questionList.question.length,
                itemBuilder: (context, index) {
                  return ChatQuestion(
                    question: questionList.question[index],
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

class ChatQuestion extends StatelessWidget {
  String question;
  ChatQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFf3fdfe),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF9DF6FF),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: question,
            color: AppColors.mainBlackColor,
            fontWeight: FontWeight.w500,
            size: 16,
          ),
        ],
      ),
    );
  }
}
