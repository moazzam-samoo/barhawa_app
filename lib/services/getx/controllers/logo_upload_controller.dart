import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LogoUploadController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickLogoImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = await file.length();

      // ✅ Optional: limit to 1 MB
      if (fileSize <= 1024 * 1024) {
        selectedImage.value = file;
      } else {
        Get.snackbar("File too large", "Logo must be under 1 MB");
      }
    }
  }

  void clearImage() {
    selectedImage.value = null;
  }
}
