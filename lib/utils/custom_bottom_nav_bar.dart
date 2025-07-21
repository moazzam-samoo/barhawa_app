import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../services/getx/controllers/bottom_navigation/bottom_navigation_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.shop), label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.box_1), label: 'Sales'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_2user5),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
