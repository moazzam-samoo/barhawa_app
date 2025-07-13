import 'package:barhawa_app/auth/onboarding/getstarted_screen.dart';
import 'package:barhawa_app/auth/onboarding/onboarding_screen.dart';
import 'package:barhawa_app/auth/onboarding/user_confirmation_screen.dart';
import 'package:barhawa_app/pages/screens/congratulation_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../auth/splash_screen.dart';
import '../pages/screens/shop_creation/shop_creation_screen.dart';

/// This class defines all application route names and their corresponding GetPage routes.
/// It centralizes navigation to help manage and maintain the app's screen transitions.
class AppRoutes {
  // Route name constants
  static String splash = "/";
  static String onboarding = "/onboarding";
  static String userConfirmation = "/userConfirmation";
  static String getStarted = "/getStarted";
  static String congratulationScreen = "/congratulationScreen";
  static String shopCreation = "/shopCreation";

  // Helper methods to get route strings
  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;
  static String getUserConfirmationRoute() => userConfirmation;
  static String getGetStartedRoute() => getStarted;
  static String getCongratulationScreen() => congratulationScreen;
  static String getShopCreationScreen() => shopCreation;

  /// List of all GetX pages used in the application.
  /// Each GetPage maps a route name to its screen widget.
  static List<GetPage> routes = [
    // Splash screen route
    GetPage(name: splash, page: () => SplashScreen()),

    // Onboarding screen route
    GetPage(name: onboarding, page: () => OnboardingScreen()),

    // User confirmation screen route
    GetPage(name: userConfirmation, page: () => UserConfirmationScreen()),

    // Get started screen route
    GetPage(name: getStarted, page: () => GetStartedScreen()),

    // Congratulation screen shown after successful signup
    GetPage(name: congratulationScreen, page: () => CongratulationScreen()),

    // Shop creation screen route
    GetPage(name: shopCreation, page: () => ShopCreationScreen()),
  ];
}
