import 'package:flutter/material.dart';
import 'package:wear_work/utils/routes.dart';

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
      // home: const MaidRegistrationScreen(),
      initialRoute: "/maidRegistrationScreen",
      onGenerateRoute: OnGenerateRouting.onGenerateRoute,
    );
  }
}
