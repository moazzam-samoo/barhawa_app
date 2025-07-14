import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/services/getx/controllers/dropdown_controller.dart';

class CustomCategoryDropdown extends StatelessWidget {
  final CategoryDropdownController controller = Get.put(
    CategoryDropdownController(),
  );

  CustomCategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: controller.selectedCategory.value.isEmpty
            ? null
            : controller.selectedCategory.value,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          hintText: "Select Category",
          hintStyle: AppTextStyles.bodyLarge.copyWith(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xffD0D5DD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        style: AppTextStyles.bodyLarge.copyWith(color: Colors.black),
        items: controller.categoryOptions.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: AppTextStyles.bodyLarge),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            controller.setCategory(value);
          }
        },
      );
    });
  }
}
