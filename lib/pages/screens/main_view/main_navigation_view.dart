import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/getx/controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../../../utils/custom_bottom_nav_bar.dart';

class MainNavigationView extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: CustomBottomNavBar(),
      );
    });
  }
}
