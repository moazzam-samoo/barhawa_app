import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_ui.dart';

class CustomSecondaryButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  const CustomSecondaryButton({
    super.key,
    this.textColor,
    this.color,
    required this.text,
    this.onTap,
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
          border: Border.all(color: color ??  AppColors.primary),
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                AppTextStyles.description.copyWith(
                  color: textColor ?? AppColors.primary,
                ),
          ),
        ),
      ),
    );
  }
}
