import 'package:barhawa_app/auth/onboarding/getstarted_screen.dart';
import 'package:barhawa_app/auth/onboarding/onboarding_screen.dart';
import 'package:barhawa_app/auth/onboarding/user_confirmation_screen.dart';
import 'package:barhawa_app/pages/screens/congratulation_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../auth/splash_screen.dart';

class AppRoutes {
  static String splash = "/";
  static String onboarding = "/onboarding";
  static String userConfirmation = "/userConfirmation";
  static String getStarted = "/getStarted";
  static String congratulationScreen = "/congratulationScreen";

  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;
  static String getUserConfirmationRoute() => userConfirmation;
  static String getGetStartedRoute() => getStarted;
  static String getCongratulationScreen() => congratulationScreen;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: userConfirmation, page: () => UserConfirmationScreen()),
    GetPage(name: getStarted, page: () => GetStartedScreen()),
    GetPage(name: congratulationScreen, page: () => CongratulationScreen()),
  ];
}
