import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:barhawa_app/pages/screens/home_screen.dart';
// import other screens similarly

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    Placeholder(), // Replace with ShopScreen()
    Placeholder(), // Replace with InventoryScreen()
    Placeholder(), // Replace with SalesScreen()
    Placeholder(), // Replace with AccountScreen()
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
