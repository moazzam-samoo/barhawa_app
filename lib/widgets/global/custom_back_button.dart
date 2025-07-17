import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';

Widget customBackButton({
  VoidCallback? onTap,
  Color? backgroundColor,
  IconData icon = CupertinoIcons.back,
  Color iconColor = const Color(0xFF000000),
  double? height,
  double? width,
  double borderRadius = 8,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? 40.h,
      width: width ?? 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? AppColors.containers,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    ),
  );
}
