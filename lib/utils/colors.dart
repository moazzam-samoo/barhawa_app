import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xffD52941);
  static  Color primaryLight = Color(0xffD52941).withOpacity(20); // 20% opacity
  static const Color secondary  = Color(0xff231F20);
  static const Color lightBackground  = Color(0xffEFF1F3);
  static const Color containers  = Color(0xffEBEEF2);


  //Text Colors
  static const Color primaryText = Color(0xFF17181C);
  static const Color secondaryText = Color(0xFFAAAEBB);
  static const Color trinaryText = Color(0xffEFF1F3);
  static const Color redText = Color(0xFFD52941);
  static const Color greyText = Color(0xFF4B5768);



  // Gradient (Primary_4)
  static const Color gradientStart = Color(0xFF6F1522);
  static const Color gradientEnd = Color(0xFFD52941);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
