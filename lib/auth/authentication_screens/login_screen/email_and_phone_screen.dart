// Import necessary packages and project files
import 'package:barhawa_app/services/getx/controllers/auth_controllers/login_controller.dart';
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

// Login screen for user authentication
class LoginScreen extends StatelessWidget {
  // Create and bind LoginController using GetX
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea to avoid UI under system UI elements
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: Padding(
          padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 36.h),
                  // ---------- Screen Title ----------
                  Text(
                    "Login",
                    style: AppTextStyles.h1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // ---------- Subtitle ----------
                  Text(
                    "Welcome back to Bahrawa!",
                    style: AppTextStyles.description.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ---------- Tab Switch between Email & Phone ----------
                  Row(
                    children: [
                      // Email Tab
                      GestureDetector(
                        onTap: () => controller.toggleTab(LoginTab.email),
                        child: Column(
                          children: [
                            Text(
                              "Email",
                              style: AppTextStyles.bodyLarge.copyWith(
                                color:
                                    controller.selectedTab.value ==
                                        LoginTab.email
                                    ? AppColors.primary
                                    : AppColors.secondaryText,
                              ),
                            ),
                            // Underline for selected tab
                            if (controller.selectedTab.value == LoginTab.email)
                              Container(
                                height: 2,
                                width: 24,
                                margin: EdgeInsets.only(top: 4),
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 24),

                      // Phone Tab
                      GestureDetector(
                        onTap: () => controller.toggleTab(LoginTab.phone),
                        child: Column(
                          children: [
                            Text(
                              "Phone Number",
                              style: AppTextStyles.bodyLarge.copyWith(
                                color:
                                    controller.selectedTab.value ==
                                        LoginTab.phone
                                    ? AppColors.primary
                                    : AppColors.secondaryText,
                              ),
                            ),
                            if (controller.selectedTab.value == LoginTab.phone)
                              Container(
                                height: 2,
                                width: 24,
                                margin: EdgeInsets.only(top: 4),
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // ---------- Conditional Field Input ----------
                  if (controller.selectedTab.value == LoginTab.email) ...[
                    // Email Field
                    LabelText(text: "Email Address"),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: "aslambhai@gmail.com",
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ] else ...[
                    // Phone Number Field
                    Text("Phone number", style: AppTextStyles.bodyMedium),
                    SizedBox(height: 8.h),
                    IntlPhoneField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        hintText: "Phone number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: Color(0xffD0D5DD),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      initialCountryCode: 'PK',
                      onChanged: (phone) {}, // Optional callback
                    ),
                  ],

                  SizedBox(height: 16.h),

                  // ---------- Password Input with Toggle ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(text: "Password"),
                      GestureDetector(
                        onTap: () {
                          // TODO: Add forgot password functionality
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Reactive Password Field with Obscure Toggle
                  Obx(() {
                    return CustomTextField(
                      hintText: "••••••••",
                      controller: controller.passwordController,
                      isEnabled: true,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      obscureText: !controller.isPasswordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    );
                  }),

                  SizedBox(height: 24.h),

                  // ---------- Login Button ----------
                  CustomPrimaryButton(
                    text: "Login",
                    color: AppColors.primary,
                    onTap: () {
                      // TODO: Add login logic here
                    },
                  ),
                  SizedBox(height: 24.h),

                  // ---------- Divider with Text ----------
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

                  SizedBox(height: 24.h),

                  // ---------- Google Sign-in ----------
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement Google sign-in
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.containers,
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

                  SizedBox(height: 80.h),

                  // ---------- Navigate to Create Account ----------
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
