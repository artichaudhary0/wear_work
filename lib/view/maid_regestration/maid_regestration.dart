import 'dart:typed_data';
import 'package:wear_work/utils/app_constants.dart';
import 'package:wear_work/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/view/hire_maid/widget/search_filter.dart';
import 'package:wear_work/widgets/big_text.dart';
import 'package:wear_work/widgets/small_text.dart';

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

  Uint8List? _pickedProfileImage;
  Uint8List? _pickedAadharImage;
  Uint8List? _pickedVoterIdImage;
  Uint8List? _pickedCovidCertificateImage;
  void selectProfileImage() async {
    Uint8List pickedImagePath =
        await AppExtension.pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedProfileImage = pickedImagePath;
      });
    }
  }

  void selectAadharImage() async {
    Uint8List pickedImagePath =
        await AppExtension.pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedAadharImage = pickedImagePath;
      });
    }
  }

  void selectVoterIdImage() async {
    Uint8List pickedImagePath =
        await AppExtension.pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedVoterIdImage = pickedImagePath;
      });
    }
  }

  void selectCovidCertificateImage() async {
    Uint8List pickedImagePath =
        await AppExtension.pickedImage(imageSource: ImageSource.gallery);
    if (pickedImagePath != null) {
      setState(() {
        _pickedCovidCertificateImage = pickedImagePath;
      });
    }
  }

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
                  _pickedProfileImage != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(
                            _pickedProfileImage!,
                          ),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage:
                              AssetImage("assets/app_icons/profile2.png"),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.lightBlue),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: selectProfileImage,
                        icon: const Icon(
                          color: AppColors.white,
                          Icons.edit,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 12),
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
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              //  SearchFilterRow(
              //   title: 'Age',
              //   ageRange: "65 Yr",
              // ),
              //  SearchFilterRow(
              //   title: 'Gender',
              //   ageRange: "Female",
              // ),
              const SearchFilterRow(
                title: 'Age',
                initialValue: '0-10', // Initial age range
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
              BigText(
                text: "Language",
                fontWeight: FontWeight.w600,
                size: 20,
              ),
              const Divider(),
              const SizedBox(height: 12),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              const SizedBox(height: 10),
              const SizedBox(height: 5),
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
              buildImageContainer(
                image: _pickedAadharImage,
                text: "Aadhar Card",
                onPressed: selectAadharImage,
              ),
              buildImageContainer(
                image: _pickedVoterIdImage,
                text: "Voter ID",
                onPressed: selectVoterIdImage,
              ),
              buildImageContainer(
                image: _pickedCovidCertificateImage,
                text: "COVID-19",
                onPressed: selectCovidCertificateImage,
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

Widget buildImageContainer({
  required Uint8List? image,
  required String text,
  required VoidCallback onPressed,
}) {
  return Container(
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
    child: image != null
        ? Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(image),
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 30,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.add_circle,
                        size: 57,
                        color: AppColors.lightBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: text,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlue,
                      size: 16,
                    )
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.add_circle,
                  size: 57,
                  color: AppColors.lightBlue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BigText(
                text: text,
                fontWeight: FontWeight.w500,
                color: AppColors.lightBlue,
                size: 16,
              )
            ],
          ),
  );
}
