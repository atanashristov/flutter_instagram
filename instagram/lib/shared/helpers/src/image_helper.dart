import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<File?> pickImageFromGalery({
    required Color toolbarColor,
    required CropStyle cropStyle,
    required String title,
  }) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        cropStyle: cropStyle,
        // compressFormat: ImageCompressFormat.jpg, // default
        compressQuality: 70,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: title,
            toolbarColor: toolbarColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: title,
          ),
        ],
      );
      return File(croppedFile!.path);
    }
    return null;
  }
}
