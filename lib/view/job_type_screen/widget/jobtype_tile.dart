
import 'package:flutter/material.dart';
import 'package:wear_work/widgets/big_text.dart';

class JobTypeTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function()? onTap;
  const JobTypeTile(
      {super.key, required this.imagePath, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              BigText(
                text: title,
                size: 24,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
