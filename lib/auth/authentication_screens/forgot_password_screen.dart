// Import necessary packages and files
import 'package:barhawa_app/services/getx/controllers/auth_controllers/forgo_password_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/feature/custom_phone_field.dart';
import 'package:barhawa_app/widgets/global/custom_back_button.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/global/label_text.dart';

// ForgotPasswordScreen allows users to request a password reset via phone number
class ForgotPasswordScreen extends StatelessWidget {
  // Initialize the ForgotPasswordController using GetX for state management
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside input
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 70.h, left: 32.w, right: 32.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---------- Custom Back Button ----------
                customBackButton(),
                SizedBox(height: 48.h),

                // ---------- Screen Title ----------
                Text(
                  "Forgot Password",
                  style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10.h),

                // ---------- Description Text ----------
                Text(
                  "Enter your phone number to get the password reset link.",
                  style: AppTextStyles.description.copyWith(
                    color: AppColors.greyText,
                  ),
                ),

                SizedBox(height: 58.h),

                // ---------- Phone Number Input ----------
                LabelText(text: "Phone Number"),
                SizedBox(height: 8.h),
                CustomPhoneField(
                  hintText: "| 122123123", // Placeholder hint
                  controller: controller.phoneController, // Binds to controller
                ),

                SizedBox(height: 26.h),

                // ---------- Password Reset Button ----------
                CustomPrimaryButton(
                  text: "Password Reset",
                  color: AppColors.primary,
                  onTap: () {
                    // TODO: Add password reset logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
