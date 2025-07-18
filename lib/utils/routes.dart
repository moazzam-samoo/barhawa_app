import 'package:barhawa_app/auth/authentication_screens/create_account_screen/create_account_screen.dart';
import 'package:barhawa_app/auth/onboarding/getstarted_screen.dart';
import 'package:barhawa_app/auth/onboarding/onboarding_screen.dart';
import 'package:barhawa_app/auth/onboarding/user_confirmation_screen.dart';
import 'package:barhawa_app/pages/screens/congratulation_screen.dart';
import 'package:barhawa_app/pages/screens/shop_details_confirmation/shop_detail_confirmation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../auth/authentication_screens/login_screen/email_and_phone_screen.dart';
import '../auth/splash_screen.dart';
import '../pages/screens/shop_creation/shop_creation_screen.dart';

/// This class defines all application route names and their corresponding GetPage routes.
/// It centralizes navigation to help manage and maintain the app's screen transitions.
class AppRoutes {
  // Route name constants
  static String splash = "/";
  static String onboarding = "/onboarding";
  static String loginScreen = "/loginScreen";
  static String createAccountScreen = "/createAccountScreen";
  static String userConfirmation = "/userConfirmation";
  static String getStarted = "/getStarted";
  static String congratulationScreen = "/congratulationScreen";
  static String shopCreation = "/shopCreation";
  static String shopDetails = "/shopDetails";

  // Helper methods to get route strings
  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;
  static String getLoginScreen() => loginScreen;
  static String getCreateAccountScreen() => createAccountScreen;
  static String getUserConfirmationRoute() => userConfirmation;
  static String getGetStartedRoute() => getStarted;
  static String getCongratulationScreen() => congratulationScreen;
  static String getShopCreationScreen() => shopCreation;
  static String getShopDetailsScreen() => shopDetails;

  /// List of all GetX pages used in the application.
  /// Each GetPage maps a route name to its screen widget.
  static List<GetPage> routes = [
    // Splash screen route
    GetPage(name: splash, page: () => SplashScreen()),

    // Onboarding screen route
    GetPage(name: onboarding, page: () => OnboardingScreen()),

    // User confirmation screen route
    GetPage(name: userConfirmation, page: () => UserConfirmationScreen()),

    GetPage(name: loginScreen, page: () => LoginScreen()),

    GetPage(name: createAccountScreen, page: () => CreateAccountScreen()),

    // Get started screen route
    GetPage(name: getStarted, page: () => GetStartedScreen()),

    // Congratulation screen shown after successful signup
    GetPage(name: congratulationScreen, page: () => CongratulationScreen()),

    // Shop creation screen route
    GetPage(name: shopCreation, page: () => ShopCreationScreen()),

    // Shop details screen route
    GetPage(name: shopDetails, page: () => ShopDetailConfirmation()),
  ];
}
