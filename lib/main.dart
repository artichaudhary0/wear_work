import 'package:flutter/material.dart';
import 'package:wear_work/utils/routes.dart';
import 'package:wear_work/view/elder_care/elder_care_screen.dart';
import 'package:wear_work/view/select_date_time/select_date_time_screen.dart';
import 'package:wear_work/view/select_maid/select_maid-screen.dart';
import 'package:wear_work/view/vehicle_washing/vehicle_washing_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Work',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splashScreen",
      onGenerateRoute: OnGenerateRouting.onGenerateRoute,
    );
  }
}
