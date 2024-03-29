import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/job_type_screen/widget/jobtype_tile.dart';
import 'package:wear_work/widgets/big_text.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 28,
              color: AppColors.mainColor,
            ),
          ),
        ),
        title: BigText(
          text: "Select Services",
          size: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(children: [
        JobTypeTile(
          imagePath: 'assets/images/services/cooking.png',
          title: 'Cooking',
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/cleaning.png',
          title: 'Cleaning',
          onTap: () {},
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/event-cleanup.png',
          title: 'Event Cleanup',
          onTap: () {},
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/baby-sitter.png',
          title: 'Baby Sitter',
          onTap: () {},
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/pool-cleanup.png',
          title: 'Pool Cleanup',
          onTap: () {},
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/elder-care.png',
          title: 'Elder Care',
          onTap: () {},
        ),
        JobTypeTile(
          imagePath: 'assets/images/services/vehicle-washing.png',
          title: 'Vehicle Washing',
          onTap: () {},
        ),
      ]),
    );
  }
}
