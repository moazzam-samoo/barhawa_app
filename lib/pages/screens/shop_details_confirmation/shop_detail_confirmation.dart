import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:barhawa_app/widgets/global/custom_back_button.dart';
import 'package:barhawa_app/widgets/global/primary_button.dart';
import 'package:barhawa_app/widgets/global/secondary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ShopDetailConfirmation extends StatelessWidget {
  const ShopDetailConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70.h, left: 32.w, right: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            customBackButton(
              onTap: () {
                Get.back();
              },
            ),

            SizedBox(height: 40.h),

            // Title Text
            Text(
              "Your shop is ready!",
              style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10.h),

            // Subtitle Text
            Text(
              "You've successfully set up your shop. Let's start managing it digitally with barhawa!",
              style: AppTextStyles.description.copyWith(
                color: AppColors.greyText,
              ),
            ),

            SizedBox(height: 40.h),

            // Shop Information Card
            Container(
              height: 105.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.containers,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  // Shop Avatar
                  CircleAvatar(
                    radius: 34.r,
                    backgroundImage: AssetImage('assets/icons/pizza.png'),
                  ),

                  SizedBox(width: 12.w),

                  // Shop Name and Address
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shop Title
                        Text(
                          "Italian Pizza",
                          style: AppTextStyles.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 4.h),

                        // Shop Subtitle/Address
                        Text(
                          "Street 7, Latifabad Hyderabad",
                          style: AppTextStyles.caption,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Edit Icon
                  IconButton(
                    onPressed: () {
                      // TODO: Handle edit tap
                    },
                    icon: Icon(
                      Icons.mode_edit_outlined,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),

            // Primary Action Button
            CustomPrimaryButton(
              text: "Go to My Shop",
              color: AppColors.primary,
            ),

            SizedBox(height: 20.h),

            // Secondary Action Button
            CustomSecondaryButton(text: "Add Products"),
          ],
        ),
      ),
    );
  }
}
