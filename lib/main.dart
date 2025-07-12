import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:barhawa_app/utils/routes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Defined ScreenUtil Package for Responsive UI for every size of the screen.
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        //replaced Material app to GetMaterialApp for stateManagement
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Barhawa App',
          //Defined own routes with GETx state management for Routing Easily and understandable
          initialRoute: AppRoutes.getCongratulationScreen(),
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
