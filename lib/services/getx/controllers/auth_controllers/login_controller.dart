import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoginTab { email, phone }

class LoginController extends GetxController {
  Rx<LoginTab> selectedTab = LoginTab.email.obs;

  // Fields
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  void toggleTab(LoginTab tab) {
    selectedTab.value = tab;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
