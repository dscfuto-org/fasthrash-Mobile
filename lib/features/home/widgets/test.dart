import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestPicker extends StatefulWidget {
  const TestPicker({super.key});

  @override
  State<TestPicker> createState() => _TestPickerState();
}

class _TestPickerState extends State<TestPicker> {
  @override
  Widget build(BuildContext context) {
     File? imageFile;
    /// Get from gallery
    _getFromGallery() async {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
         imageFile = File(pickedFile.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Picker image'),
      ),
      body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                  
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: const Text("PICK FROM GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  TextButton(
               
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: const Text("PICK FROM GALLERY"),
                  )
                ],
              ),
            ): Image.file(
              imageFile!,
              fit: BoxFit.cover,
            ))
  
    );
  }
}
