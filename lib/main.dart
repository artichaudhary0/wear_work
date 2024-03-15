import 'package:flutter/material.dart';
import 'package:wear_work/utils/routes.dart';
import 'package:wear_work/view/on_boarding/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Work',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/signUpScreen",
      onGenerateRoute: OnGenerateRouting.onGenerateRoute,
      home: const OnBoardingScreen(),
    );
  }
}
