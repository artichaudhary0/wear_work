import 'package:flutter/material.dart';
import 'package:wear_work/utils/app_list.dart';
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
  AppLists selectServiceType = AppLists();

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
        children: selectServiceType.getServiceTiles(context)
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
