import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/job_type_screen/widget/jobtype_tile.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/custom_appbar.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({Key? key}) : super(key: key);

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  List<Map<String, dynamic>> getServiceTiles() {
    return [
      {
        'imagePath': 'assets/images/services/cooking.png',
        'title': 'Cooking',
        'onTap': () {
          Navigator.pushNamed(context, "/cookingServiceScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/cleaning.png',
        'title': 'Cleaning',
        'onTap': () {
          Navigator.pushNamed(context, "/homeCleaningServiceScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/event-cleanup.png',
        'title': 'Event Cleanup',
        'onTap': () {
          Navigator.pushNamed(context, "/eventCleaningServiceScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/baby-sitter.png',
        'title': 'Baby Sitter',
        'onTap': () {
          Navigator.pushNamed(context, "/babyCareScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/pool-cleanup.png',
        'title': 'Pool Cleanup',
        'onTap': () {
          Navigator.pushNamed(context, "/poolCleaningServiceScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/elder-care.png',
        'title': 'Elder Care',
        'onTap': () {
          Navigator.pushNamed(context, "/elderCareScreen");
        },
      },
      {
        'imagePath': 'assets/images/services/vehicle-washing.png',
        'title': 'Vehicle Washing',
        'onTap': () {
          Navigator.pushNamed(context, "/vehicleWashingScreen");
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Select Services",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28,
          ),
        ),
      ),
      body: ListView(
        children: getServiceTiles()
            .map<Widget>(
              (tile) => JobTypeTile(
                imagePath: tile['imagePath'],
                title: tile['title'],
                onTap: tile['onTap'],
              ),
            )
            .toList(),
      ),
    );
  }
}
