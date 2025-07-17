import 'package:barhawa_app/auth/onboarding/onboarding_common_widgets.dart';
import 'package:barhawa_app/services/getx/controllers/onboarding_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  // Controller to manage current onboarding page and data
  final controller = OnboardingController();

  // PageController for controlling the PageView scroll
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: controller.onboardingPages.length,

        // Update current page index in controller
        onPageChanged: (index) {
          controller.currentPage.value = index;
        },

        // Build each onboarding page
        itemBuilder: (context, index) {
          final page = controller.onboardingPages[index];

          return Padding(
            padding: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
            child: Column(
              children: [
                // Onboarding Image
                imageShade(page.imageAsset),

                SizedBox(height: 20.h),

                // Onboarding Title
                Text(
                  page.title,
                  style: AppTextStyles.h3,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 10.h),

                // Onboarding Description
                Text(
                  page.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20.h),

                // Page Indicator Dots
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                      (dotIndex) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 6.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == dotIndex
                              ? AppColors.primary
                              : AppColors.secondaryText.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Primary Button: Skip to Get Started
                CustomPrimaryButton(
                  text: "Get's Started",
                  onTap: () => Get.offAllNamed(AppRoutes.getGetStartedRoute()),
                ),

                SizedBox(height: 12.h),

                // Secondary Button: Next or Finish
                CustomSecondaryButton(
                  text: "Next",
                  onTap: () {
                    if (controller.currentPage.value <
                        controller.onboardingPages.length - 1) {
                      // Move to next onboarding screen
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Final page: Navigate to Get Started and remove history
                      Get.offAllNamed(AppRoutes.getGetStartedRoute());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
