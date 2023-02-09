import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart' show immutable, BuildContext;
import 'package:image_picker/image_picker.dart';

@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future pickImageFromGallery() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedImage != null) {
        log('Name of image is ${pickedImage.name} and the path is ${pickedImage.path}');
      }
    } catch (ex) {
      log('Error from picking image: ' + ex.toString());
    } finally {
      log('Done');
    }
  }
}
