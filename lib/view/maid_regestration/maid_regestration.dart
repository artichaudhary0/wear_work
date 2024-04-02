import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';

import '../../utils/app_constants.dart';
import '../../widgets/small_text.dart';

class MaidRegistrationScreen extends StatefulWidget {
  const MaidRegistrationScreen({Key? key}) : super(key: key);

  @override
  _MaidRegistrationScreenState createState() => _MaidRegistrationScreenState();
}

class _MaidRegistrationScreenState extends State<MaidRegistrationScreen> {
  int _activeCurrentStep = 0;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

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

  TimeEnum? selectedFood = TimeEnum.week;
  WorkingTime? selectedWorkingTime = WorkingTime.morning;
  final List<String> languages = ['English', 'Hindi', 'Gujarati', "Tamil"];

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/maid/maid 2.png"),
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
                controller: firstName,
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
                controller: lastName,
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
                controller: phoneNumber,
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
                ageRange: "65 Yr",
              ),
              const SearchFilterRow(
                title: 'Gender',
                ageRange: "Female",
              ),
              const SizedBox(
                height: 12,
              ),
              BigText(
                text: "Language",
                fontWeight: FontWeight.w600,
                size: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: languages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ActionChip(
                      label: Text(languages[index]),
                      onPressed: () {
                        // Handle action for the selected language
                        print('Selected language: ${languages[index]}');
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1,
                  ),
                ),
              ),
              BigText(
                text: "Service Time",
                fontWeight: FontWeight.w600,
                size: 20,
              ),
              const Divider(),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: SmallText(
                  text: "Morning ( 9-12 PM )",
                  color: AppColors.mainBlackColor,
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
                dense: true,
                value: WorkingTime.morning,
                groupValue: selectedWorkingTime,
                onChanged: (v) {
                  setState(() {
                    selectedWorkingTime = v!;
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: SmallText(
                  text: "Afternoon ( 12-3 PM )",
                  color: AppColors.mainBlackColor,
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
                dense: true,
                value: WorkingTime.afternoon,
                groupValue: selectedWorkingTime,
                onChanged: (v) {
                  setState(() {
                    selectedWorkingTime = v!;
                  });
                },
              ),
              RadioListTile(
                  value: WorkingTime.evening,
                  contentPadding: EdgeInsets.zero,
                  title: SmallText(
                    text: "Evening ( 3-6 PM )",
                    color: AppColors.mainBlackColor,
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  dense: true,
                  groupValue: selectedWorkingTime,
                  onChanged: (v) {
                    setState(() {
                      selectedWorkingTime = v!;
                    });
                  }),
            ],
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Confirm'),
          content: Column(
            children: [
              Container(
                width: double.infinity,
                height: 190.0,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3FDFE),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF9DF6FF),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle,
                      size: 57,
                      color: AppColors.lightBlue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "Aadhar Card",
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlue,
                      size: 16,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 190,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3FDFE),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF9DF6FF),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle,
                      size: 57,
                      color: AppColors.lightBlue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "Voter Id",
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlue,
                      size: 16,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 190,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3FDFE),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF9DF6FF),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle,
                      size: 57,
                      color: AppColors.lightBlue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "COVID-19 Vaccination Certificate",
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlue,
                      size: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Step(
          state:
              _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 1,
          title: const Text('Address'),
          content: Column(
            children: getServiceTiles()
                .map<Widget>((tile) => GestureDetector(
                      onTap: tile["onTap"],
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  tile["imagePath"],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              BigText(
                                text: tile["title"],
                                size: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maid Registration'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _activeCurrentStep,
              steps: stepList(),
              onStepContinue: () {
                if (_activeCurrentStep < (stepList().length - 1)) {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                if (_activeCurrentStep == 0) {
                  return;
                }

                setState(() {
                  _activeCurrentStep -= 1;
                });
              },
              onStepTapped: (int index) {
                setState(() {
                  _activeCurrentStep = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
