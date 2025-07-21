import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:barhawa_app/utils/colors.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String initialCountryCode;
  final void Function(PhoneNumber)? onChanged;
  final String hintText;

  const CustomPhoneField({
    super.key,
    this.controller,
    this.initialCountryCode = 'PK',
    this.onChanged,
    this.hintText = "| 122123123",
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xffD0D5DD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xffD0D5DD)),
        ),
      ),
    );
  }
}
