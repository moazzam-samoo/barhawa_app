import 'package:barhawa_app/auth/onboarding/onboarding_common_widgets.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserConfirmationScreen extends StatelessWidget {
  const UserConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 22.w, right: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageShade("onboarding_1.png"),

            SizedBox(height: 20.h),
            Text(
              "Manage your shop with ease—anytime, anywhere.",
              style: AppTextStyles.h3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "Choose your path below to continue managing your business seamlessly",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 50.h),
            CustomPrimaryButton(
              text: "New User",
              onTap: () => Get.toNamed(AppRoutes.getOnboardingRoute()),
            ),
            SizedBox(height: 12.h),
            CustomSecondaryButton(
              text: "Existing Account",
              onTap: () {
                Get.offAllNamed(AppRoutes.getLoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
