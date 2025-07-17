import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'firebase_options.dart';

/// Main function: Initializes the Flutter framework and Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit is used for responsive UI design across all devices
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Base design size (iPhone X dimensions)
      minTextAdapt: true, // Adapts text size for small screens
      splitScreenMode: true, // Supports split screen on tablets

      builder: (context, child) {
        // GetMaterialApp replaces MaterialApp to enable GetX features
        return GetMaterialApp(
          debugShowCheckedModeBanner: false, // Hides the debug banner
          title: 'Barhawa App',

          // Initial screen when the app starts
          initialRoute: AppRoutes.getSplashRoute(),

          // Route configuration using GetX
          getPages: AppRoutes.routes,

          // Optional: Add EasyLoading globally if you're using loading indicators
          builder: EasyLoading.init(), // Enables global EasyLoading UI
        );
      },
    );
  }
}
