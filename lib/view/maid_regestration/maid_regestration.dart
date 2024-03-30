import 'package:flutter/material.dart';
import 'package:wear_work/widgets/big_text.dart';

import '../job_type_screen/widget/jobtype_tile.dart';

class MaidRegistrationScreen extends StatefulWidget {
  const MaidRegistrationScreen({Key? key}) : super(key: key);

  @override
  _MaidRegistrationScreenState createState() => _MaidRegistrationScreenState();
}

class _MaidRegistrationScreenState extends State<MaidRegistrationScreen> {
  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
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

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Information'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
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
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Confirm'),
          content: Column(
            children: getServiceTiles()
                .map<Widget>((tile) => Card(
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
                            Spacer(),
                          ],
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
