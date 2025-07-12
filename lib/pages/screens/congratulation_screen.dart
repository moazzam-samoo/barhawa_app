import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/account_creation.png",
                height: 325,
                width: 325,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Congratulations",
              style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Thank you Aslam Bhai for signing up with us!",
              style: AppTextStyles.description.copyWith(
                color: AppColors.secondaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
