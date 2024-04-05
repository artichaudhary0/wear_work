import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/custom_appbar.dart';
import 'package:wear_work/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firsNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/maid/maid 2.png"),
                  radius: 60,
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightBlue),
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: firsNameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: lastNameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 12,
            ),
            const SearchFilterRow(
              title: 'Age',
              initialValue: '20-30', // Initial age range
              options: [
                '0-10',
                '10-20',
                '20-30',
                '30-40',
                '40-50',
                '50-60',
                '60-70',
                '70-80',
                '80-90',
                '90-100',
              ], // Age range options
            ),
            const SearchFilterRow(
              title: 'Gender',
              initialValue: 'Female', // Initial gender
              options: ['Male', 'Female', 'Other'], // Gender options
            ),
            const SizedBox(
              height: 12,
            ),
            const Spacer(),
            GradientButton(
              text: "Update",
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
