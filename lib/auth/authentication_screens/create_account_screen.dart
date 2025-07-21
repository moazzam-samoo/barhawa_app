// Import required packages and files
import 'package:barhawa_app/services/getx/controllers/auth_controllers/create_account_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/routes.dart';
import 'package:barhawa_app/widgets/global/label_text.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// CreateAccountScreen is a StatelessWidget which displays the UI for user registration
class CreateAccountScreen extends StatelessWidget {
  // Instantiate the CreateAccountController using GetX for state management
  final CreateAccountController controller = Get.put(CreateAccountController());

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dismiss keyboard on tap outside text fields
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 66.h),

          // Use Obx to listen to reactive variables from GetX controller
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading text
                Text(
                  "Create an account",
                  style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 4.h),

                // Subheading text
                Text(
                  "Join Barhawa app for free!",
                  style: AppTextStyles.description.copyWith(
                    color: AppColors.greyText,
                  ),
                ),
                SizedBox(height: 28.h),

                // ----------- Name Field -----------
                LabelText(text: "Name"),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "Aslam Bhai", // Example placeholder name
                  controller: controller.nameController, // Binds to controller
                ),
                SizedBox(height: 16.h),

                // ----------- Phone Number Field -----------
                LabelText(text: "Phone"),
                SizedBox(height: 8.h),
                IntlPhoneField(
                  controller: controller.phoneController, // Binds to controller
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Color(0xffD0D5DD)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Color(0xffD0D5DD)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                  initialCountryCode: 'PK', // Default country code
                  onChanged: (phone) {}, // Callback on phone number change
                ),
                SizedBox(height: 16.h),

                // ----------- Password Field -----------
                LabelText(text: "Password"),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "••••••••", // Password hint
                  controller:
                      controller.passwordController, // Binds to controller
                  obscureText:
                      !controller.isPasswordVisible.value, // Toggles visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed:
                        controller.togglePasswordVisibility, // Toggles state
                  ),
                ),
                SizedBox(height: 24.h),

                // ----------- Sign Up Button -----------
                CustomPrimaryButton(
                  text: "Sign up",
                  color: AppColors.primary,
                  onTap: () {
                    // TODO: Add sign up logic
                  },
                ),
                SizedBox(height: 18.h),

                // ----------- Divider with Text -----------
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "or sign in with",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Color(0xff999DA3),
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Color(0xff999DA3))),
                  ],
                ),
                SizedBox(height: 18.h),

                // ----------- Google Sign In Button -----------
                GestureDetector(
                  onTap: () {
                    // TODO: Implement Google sign-up logic
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/google.png", height: 20.h),
                        SizedBox(width: 12.w),
                        Text(
                          "Continue with Google",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // ----------- Redirect to Login Screen -----------
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.getLoginScreen(),
                      ); // Navigate to previous screen (login)
                    },
                    child: Text(
                      "Already have an account?",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
