import 'package:flutter/material.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';
import 'package:barhawa_app/utils/colors.dart';

class LabelText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;

  const LabelText({
    super.key,
    required this.text,
    this.margin,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.visible,
        style:
            style ??
            AppTextStyles.bodyLarge.copyWith(color: AppColors.primaryText),
      ),
    );
  }
}
