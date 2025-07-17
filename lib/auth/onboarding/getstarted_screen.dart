import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔽 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_last.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔽 Semi-transparent black overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),

          // 🔽 Main Text Section (Top)
          Positioned(
            top: 70.h,
            left: 22.w,
            right: 22.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline with Rich Styling
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: AppTextStyles.mainDisplay.copyWith(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    children: [
                      const TextSpan(text: "Grow Business\n"),
                      const TextSpan(text: "Get "),
                      TextSpan(
                        text: "1-Month ",
                        style: AppTextStyles.mainDisplay.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ),
                      const TextSpan(text: "Free"),
                    ],
                  ),
                ),

                SizedBox(height: 5.h),

                // Subtext Description
                Text(
                  "Track sales, print receipts, and manage your business with ease.",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.trinaryText,
                  ),
                ),
              ],
            ),
          ),

          // 🔽 Bottom Buttons Section
          Positioned(
            left: 22.w,
            right: 22.w,
            bottom: 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Login Button
                CustomPrimaryButton(
                  text: "Login",
                  onTap: () {
                    Get.toNamed(AppRoutes.getLoginScreen());
                  },
                  color: AppColors.primary,
                ),

                SizedBox(height: 12.h),

                // Create Account Button
                CustomSecondaryButton(
                  text: "Create Account",
                  color: Colors.white,
                  textColor: Colors.white,
                  onTap: () {
                   Get.toNamed(AppRoutes.getCreateAccountScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
