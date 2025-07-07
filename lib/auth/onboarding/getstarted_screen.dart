import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔽 Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_last.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔽 Dark overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),

          // 🔽 Top Text Content
          Positioned(
            top: 70.h,
            left: 22.w,
            right: 22.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: AppTextStyles.mainDisplay.copyWith(
                      fontSize: 38,
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
                Text(
                  "Track sales, print receipts, and manage your business with ease.",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.trinaryText,
                  ),
                ),
              ],
            ),
          ),

          // 🔽 Bottom Buttons
          Positioned(
            left: 22.w,
            right: 22.w,
            bottom: 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomPrimaryButton(text: "Login", color: AppColors.primary),
                SizedBox(height: 12.h),
                CustomSecondaryButton(
                  text: "Create Account",
                  color: Colors.white,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
