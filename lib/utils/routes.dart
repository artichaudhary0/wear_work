import 'package:flutter/material.dart';
import 'package:wear_work/view/baby_care/baby_care_screen.dart';
import 'package:wear_work/view/cooking_service_screen/cooking_service_screen.dart';
import 'package:wear_work/view/elder_care/elder_care_screen.dart';
import 'package:wear_work/view/event_cleaning/event_cleaning_screen.dart';
import 'package:wear_work/view/hire_maid/hire_maid.dart';
import 'package:wear_work/view/hire_maid/select_service/select_service.dart';
import 'package:wear_work/view/home_cleaning/home_cleaning_screen.dart';
import 'package:wear_work/view/job_type_screen/job_type_screen.dart';
import 'package:wear_work/view/location_screen/location_screen.dart';
import 'package:wear_work/view/login_screen/login_screen.dart';
import 'package:wear_work/view/on_boarding/on_boarding.dart';
import 'package:wear_work/view/payment_screen/payment_screen.dart';
import 'package:wear_work/view/pool_cleaning/pool_cleaning_screen.dart';
import 'package:wear_work/view/select_date_time/select_date_time_screen.dart';
import 'package:wear_work/view/select_maid/select_maid-screen.dart';
import 'package:wear_work/view/signup_screen/signup_screen.dart';
import 'package:wear_work/view/splash_screen/splash_screen.dart';
import 'package:wear_work/view/transaction_success_screen/transaction_success_screen.dart';
import 'package:wear_work/view/vehicle_washing/vehicle_washing_screen.dart';

class OnGenerateRouting {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/splashScreen":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case "/onBoardingScreen":
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case "/signUpScreen":
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case "/loginScreen":
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/locationScreen":
        return MaterialPageRoute(
          builder: (context) => const LocationScreen(),
        );
      case "/jobTypeScreen":
        return MaterialPageRoute(
          builder: (context) => const JobTypeScreen(),
        );
      case "/hireMaidScreen":
        return MaterialPageRoute(
          builder: (context) => const HireMaidScreen(),
        );
      case "/selectServiceScreen":
        return MaterialPageRoute(
          builder: (context) => const SelectServiceScreen(),
        );
      case "/cookingServiceScreen":
        return MaterialPageRoute(
          builder: (context) => const CookingServiceScreen(),
        );
      case "/homeCleaningServiceScreen":
        return MaterialPageRoute(
          builder: (context) => const HomeCleaningServiceScreen(),
        );
      case "/eventCleaningServiceScreen":
        return MaterialPageRoute(
          builder: (context) => const EventCleaningServiceScreen(),
        );
      case "/poolCleaningServiceScreen":
        return MaterialPageRoute(
          builder: (context) => const PoolCleaningServiceScreen(),
        );
      case "/elderCareScreen":
        return MaterialPageRoute(
          builder: (context) => const ElderCareScreen(),
        );
      case "/vehicleWashingScreen":
        return MaterialPageRoute(
          builder: (context) => const VehicleWashingScreen(),
        );
      case "/selectDateAndTimeScreen":
        return MaterialPageRoute(
          builder: (context) => const SelectDateAndTime(),
        );
      case "/selectMaidScreen":
        return MaterialPageRoute(
          builder: (context) => const SelectMaidScreen(),
        );
      case "/babyCareScreen":
        return MaterialPageRoute(
          builder: (context) => const BabyCareScreen(),
        );
      case "/paymentScreen":
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );
      case "/transactionSuccessScreen":
        return MaterialPageRoute(
          builder: (context) => const TransactionSuccessScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
