// Import necessary packages and components
import 'package:barhawa_app/services/getx/controllers/auth_controllers/otp_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/global/custom_back_button.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// OTP verification screen for phone number authentication
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  // Instantiate OTPController using GetX
  final OTPController controller = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(top: 70.h, left: 32.w, right: 32.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ---------- Back Button ----------
                        customBackButton(),
                        SizedBox(height: 32.h),

                        // ---------- Screen Title ----------
                        Text(
                          "OTP Verification",
                          style: AppTextStyles.h1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6.h),

                        // ---------- Description ----------
                        Text(
                          "Enter the verification code we just sent on your phone number.",
                          style: AppTextStyles.description.copyWith(
                            color: AppColors.greyText,
                          ),
                        ),
                        SizedBox(height: 28.h),

                        // ---------- OTP Input Field ----------
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          keyboardType: TextInputType.number,
                          controller: controller.otpController,
                          obscureText: false,
                          hintCharacter: '0',
                          hintStyle: AppTextStyles.bodyLarge.copyWith(
                            color: const Color(0xffE4E7EB),
                          ),
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10.r),
                            fieldHeight: 55,
                            fieldWidth: 55,
                            activeColor: AppColors.primary,
                            selectedColor: AppColors.primary,
                            inactiveColor: const Color(0xffD0D5DD),
                          ),
                          onChanged: (value) {
                            // Optional: You can update controller.otp manually here if needed
                          },
                        ),

                        SizedBox(height: 28.h),

                        // ---------- Verify Button ----------
                        CustomPrimaryButton(
                          text: "Verify",
                          color: AppColors.primary,
                          onTap: controller
                              .verifyOTP, // Call controller's verify method
                        ),
                        SizedBox(height: 32.h),

                        // ---------- Resend OTP Countdown and Button ----------
                        Center(
                          child: Obx(() {
                            return Column(
                              children: [
                                // Countdown Text
                                Text(
                                  "Resend OTP in ${controller.secondsRemaining.value}s",
                                  style: AppTextStyles.description,
                                ),
                                SizedBox(height: 18.h),

                                // Resend Button
                                GestureDetector(
                                  onTap: controller.secondsRemaining.value == 0
                                      ? controller.resendOTP
                                      : null, // Disable until countdown is 0
                                  child: Text(
                                    "Resend OTP",
                                    style: AppTextStyles.description.copyWith(
                                      color:
                                          controller.secondsRemaining.value == 0
                                          ? AppColors.primary
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),

                        // Push everything up if screen has extra space
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
