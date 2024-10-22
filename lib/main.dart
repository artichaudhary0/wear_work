import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wear_work/firebase_options.dart';
import 'package:wear_work/utils/routes.dart';
import 'package:wear_work/view/job_type_screen/job_type_screen.dart';
import 'package:wear_work/view/login_with_munber/login_with_number.dart';
import 'package:wear_work/view/signup_screen/signup_screen.dart';

import 'controller/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Wear Work',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/splashScreen",
        onGenerateRoute: OnGenerateRouting.onGenerateRoute,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.active) {
              if (snap.hasData) {
                return const JobTypeScreen();
              } else if (snap.hasError) {
                return const Text("Error");
              } else {
                return const SignUpScreen();
              }
            } else if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snap.hasData) {
              return const SignUpScreen();
            } else {
              return Text(
                snap.error.toString(),
              );
            }
          },
        ),
      ),
    );
  }
}
