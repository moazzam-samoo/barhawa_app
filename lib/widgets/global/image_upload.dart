import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:barhawa_app/services/getx/controllers/logo_upload_controller.dart';
import 'package:barhawa_app/utils/app_text_styles.dart';

class LogoUploadBox extends StatelessWidget {
  final LogoUploadController controller = Get.put(LogoUploadController());

  LogoUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      File? image = controller.selectedImage.value;

      return GestureDetector(
        onTap: controller.pickLogoImage,
        child: DottedBorder(
          color: Colors.grey.shade400,
          strokeWidth: 1.5,
          dashPattern: [6, 3],
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: EdgeInsets.zero,
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: image == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 36,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Max logo size: 1 mb",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 136,
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
