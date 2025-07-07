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
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = OnboardingController();
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: controller.onboardingPages.length,
        onPageChanged: (index) {
          controller.currentPage.value = index; // update current page
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
            child: Column(
              children: [
                imageShade(controller.onboardingPages[index].imageAsset),
                SizedBox(height: 20.h),
                Text(
                  controller.onboardingPages[index].title,
                  style: AppTextStyles.h3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  controller.onboardingPages[index].description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondaryText,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 6.h,
                        width: controller.currentPage.value == index
                            ? 36.w
                            : 36.w,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? AppColors.primary
                              : AppColors.secondaryText.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomPrimaryButton(
                  text: "Get's Started",
                  onTap: () => Get.offNamed(AppRoutes.getGetStartedRoute()),
                ),

                SizedBox(height: 12.h),
                CustomSecondaryButton(
                  text: "Next",
                  onTap: () {
                    if (controller.currentPage.value <
                        controller.onboardingPages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // ✅ Navigate and prevent back
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
