import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barhawa_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isEnabled;
  final int maxLines;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isEnabled = true,
    this.maxLines = 1,
    this.obscureText = false, // 🔧 Optional by default
    this.suffixIcon,          // 🔧 Optional
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: isEnabled,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : maxLines, // maxLines must be 1 for obscured text
      obscureText: obscureText,
      style: TextStyle(fontSize: 14.sp, color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
        suffixIcon: suffixIcon, // ✅ Only shows if provided
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
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
