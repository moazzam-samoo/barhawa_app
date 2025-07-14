import 'package:get/get.dart';

class CategoryDropdownController extends GetxController {
  RxString selectedCategory = ''.obs;

  final List<String> categoryOptions = [
    'Restaurant',
    'Salon',
    'Pharmacy',
    'Bakery',
    'Clothing',
  ];

  void setCategory(String value) {
    selectedCategory.value = value;
  }
}
