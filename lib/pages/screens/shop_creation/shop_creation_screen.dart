import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/global/custom_dropdown.dart';
import 'package:barhawa_app/widgets/global/image_upload.dart';
import 'package:barhawa_app/widgets/global/label_text.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:barhawa_app/services/getx/controllers/dropdown_controller.dart';

class ShopCreationScreen extends StatelessWidget {
  ShopCreationScreen({super.key});

  // GetX controller for managing the selected category
  final CategoryDropdownController categoryController = Get.put(
    CategoryDropdownController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dismiss keyboard when tapping outside input fields
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          // Page padding for spacing
          padding: EdgeInsets.only(
            top: 50.h,
            left: 24.w,
            right: 24.w,
            bottom: 32.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Set up your business",
                style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),

              // Subtitle
              Text(
                "Add your shop details",
                style: AppTextStyles.description.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              SizedBox(height: 40.h),

              // Logo Upload Section
              LabelText(text: "Upload Logo"),
              SizedBox(height: 5.h),
              LogoUploadBox(), // GetX + DottedBorder image picker
              SizedBox(height: 24.h),

              // Business Name Input
              LabelText(text: "Business Name"),
              CustomTextField(hintText: "The Pizza 360"),
              SizedBox(height: 24.h),

              // Category Dropdown (GetX reactive)
              LabelText(text: "Category"),
              SizedBox(height: 6.h),
              CustomCategoryDropdown(),
              SizedBox(height: 24.h),

              // Shop Address Input
              LabelText(text: "Address"),
              CustomTextField(hintText: "Hyderabad, Saima Plaza"),
              SizedBox(height: 24.h),

              // Submit / Next Button
              CustomPrimaryButton(
                text: "Next",
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
