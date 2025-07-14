import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/// A simple congratulation screen shown after user account creation.
class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main content area with padding for spacing
      body: Padding(
        padding: EdgeInsets.only(top: 100.h, left: 40.w, right: 40.w),
        child: Column(
          children: [
            // Expanded widget takes all remaining space above the button
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Success image
                  Image.asset(
                    "assets/images/account_creation.png",
                    height: 325,
                    width: 325,
                  ),
                  SizedBox(height: 20.h),

                  // Heading: "Congratulations"
                  Text(
                    "Congratulations",
                    style: AppTextStyles.h1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Subtext thanking the user
                  Text(
                    "Thank you Aslam Bhai for signing up with us!",
                    style: AppTextStyles.description.copyWith(
                      color: AppColors.secondaryText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Button at the bottom to navigate to login screen
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.getShopCreationScreen());
              },
              child: Text(
                "Login Now",
                style: AppTextStyles.description.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            // Extra space below the button for better UI on tall screens
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
