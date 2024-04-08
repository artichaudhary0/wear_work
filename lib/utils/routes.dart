import 'package:flutter/material.dart';
import 'package:wear_work/view/browse_maid_directory/browse_home_screen/browse_home_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid/browse_main_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_before_after_screen/browse_maid_before_after_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_profile_screen/browse_maid_profile_screen.dart';
import 'package:wear_work/view/browse_maid_directory/browse_maid_search_screen/browse_maid_search_screen.dart';
import 'package:wear_work/view/browse_maid_directory/change_password_screen/change_password_screen.dart';
import 'package:wear_work/view/browse_maid_directory/edit_profile_screen/edit_profile_screen.dart';
import 'package:wear_work/view/browse_maid_directory/help_desk/help_desk.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid.dart';
import 'package:wear_work/view/hire_maid_directory/baby_care/baby_care_screen.dart';
import 'package:wear_work/view/hire_maid_directory/cooking_service_screen/cooking_service_screen.dart';
import 'package:wear_work/view/hire_maid_directory/elder_care/elder_care_screen.dart';
import 'package:wear_work/view/hire_maid_directory/event_cleaning/event_cleaning_screen.dart';
import 'package:wear_work/view/hire_maid_directory/hire_maid/select_service/select_service.dart';
import 'package:wear_work/view/hire_maid_directory/home_cleaning/home_cleaning_screen.dart';
import 'package:wear_work/view/hire_maid_directory/payment_screen/payment_screen.dart';
import 'package:wear_work/view/hire_maid_directory/pool_cleaning/pool_cleaning_screen.dart';
import 'package:wear_work/view/hire_maid_directory/select_date_time/select_date_time_screen.dart';
import 'package:wear_work/view/hire_maid_directory/select_maid/select_maid-screen.dart';
import 'package:wear_work/view/hire_maid_directory/transaction_success_screen/transaction_success_screen.dart';
import 'package:wear_work/view/hire_maid_directory/vehicle_washing/vehicle_washing_screen.dart';
import 'package:wear_work/view/job_type_screen/job_type_screen.dart';
import 'package:wear_work/view/location_screen/location_screen.dart';
import 'package:wear_work/view/login_screen/login_screen.dart';
import 'package:wear_work/view/maid_regestration/maid_regestration.dart';
import 'package:wear_work/view/on_boarding/on_boarding.dart';
import 'package:wear_work/view/signup_screen/signup_screen.dart';
import 'package:wear_work/view/splash_screen/splash_screen.dart';

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
      case "/maidRegistrationScreen":
        return MaterialPageRoute(
          builder: (context) => const MaidRegistrationScreen(),
        );
      case "/browseMaidMainScreen":
        return MaterialPageRoute(
          builder: (context) => const BrowseMaidMainScreen(),
        );
      case "/browseMaidBeforeAfterScreen":
        return MaterialPageRoute(
          builder: (context) => const BrowseMaidBeforeAfterScreen(),
        );
      case "/browseMaidProfileScreen":
        return MaterialPageRoute(
          builder: (context) => BrowseMaidProfileScreen(),
        );
      case "/browseMaidSearchScreen":
        return MaterialPageRoute(
          builder: (context) => const BrowseMaidSearchScreen(),
        );
      case "/browseMaidHomeScreen":
        return MaterialPageRoute(
          builder: (context) => const BrowseMaidHomeScreen(),
        );
      case "/helpDiskScreen":
        return MaterialPageRoute(
          builder: (context) => const HelpDiskScreen(),
        );
      case "/editProfileScreen":
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case "/changePasswordScreen":
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
