import 'dart:async';
import 'package:barhawa_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  RxInt secondsRemaining = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    startOTPTimer();
    super.onInit();
  }

  void startOTPTimer() {
    secondsRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void resendOTP() {
    // TODO: Trigger OTP resend through Firebase or backend
    startOTPTimer();
  }

  void verifyOTP() {
    final code = otpController.text.trim();
    if (code.length < 4) {
      Get.snackbar("Invalid Code", "Please enter the full 4-digit code");
      return;
    }
    Get.toNamed(AppRoutes.getResetPasswordScreen());
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
