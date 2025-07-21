import 'package:barhawa_app/services/getx/controllers/auth_controllers/reset_password_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/global/custom_back_button.dart';
import 'package:barhawa_app/widgets/global/label_text.dart';
import 'package:barhawa_app/widgets/global/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/routes.dart';
import '../../widgets/global/primary_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  // Injecting the ResetPasswordController using GetX
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // Unfocus keyboard when tapping outside text fields
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 70.h, left: 32.w, right: 32.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Custom back button
                customBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: 32.h),

                // Heading text
                Text(
                  "Reset Password",
                  style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 6.h),

                // Subheading/instructional text
                Text(
                  "Enter your new password twice below to reset a new password",
                  style: AppTextStyles.description.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
                SizedBox(height: 28.h),

                // Label for new password field
                LabelText(text: "Enter new password"),

                // New password input field with visibility toggle
                Obx(() {
                  return CustomTextField(
                    hintText: "122123123",
                    controller: controller.newPassController,
                    obscureText: controller.isNewPassVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isNewPassVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: controller.toggleNewPassVisibility,
                    ),
                  );
                }),
                SizedBox(height: 16.h),

                // Label for re-enter password field
                LabelText(text: "Re-enter new password"),

                // Confirm password input field with visibility toggle
                Obx(() {
                  return CustomTextField(
                    hintText: "••••••••",
                    controller: controller.reenterPassController,
                    obscureText: !controller.isReenterPassVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isReenterPassVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: controller.toggleReenterPassVisibility,
                    ),
                  );
                }),
                SizedBox(height: 24.h),

                // Password reset button
                CustomPrimaryButton(
                  text: "Password Reset",
                  color: AppColors.primary,
                  onTap: () {
                    // TODO: Add login logic here
                  },
                ),
                SizedBox(height: 60.h),

                // Navigation to create account screen
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.getCreateAccountScreen());
                    },
                    child: Text(
                      "Create an account",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
