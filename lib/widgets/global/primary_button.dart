import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_ui.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final Gradient? gradient;
  final TextStyle? textStyle;

  const CustomPrimaryButton({
    super.key,
    this.color,
    required this.text,
    this.onTap,
    this.gradient,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ResponsiveAppScreen.height(context) * 0.09,
        width: ResponsiveAppScreen.width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          gradient: color == null ? gradient ?? AppColors.primaryGradient : null,
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                AppTextStyles.description.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
