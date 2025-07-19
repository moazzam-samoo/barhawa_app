import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final newPassController = TextEditingController();
  final reenterPassController = TextEditingController();

  RxBool isNewPassVisible = false.obs;
  RxBool isReenterPassVisible = false.obs;

  void toggleNewPassVisibility() {
    isNewPassVisible.value = !isNewPassVisible.value;
  }

  void toggleReenterPassVisibility() {
    isReenterPassVisible.value = !isReenterPassVisible.value;
  }

}
