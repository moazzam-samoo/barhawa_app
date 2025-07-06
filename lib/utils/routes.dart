import 'package:barhawa_app/auth/onboarding/onboarding_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../auth/splash_screen.dart';

class AppRoutes {
  static String splash = "/";
  static String onboarding = "/onboarding";

  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
  ];
}
