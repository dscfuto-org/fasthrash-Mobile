import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({
    super.key,
  });

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    XFile? imageFile;
    final ImagePicker _picker = ImagePicker();
    // void pickImage() async {
    //   final imageSelected =
    //       //  await ImagePickerHelper.pickImageFromGallery();
    //       await _picker.pickImage(source: ImageSource.camera);
    //   setState(() {
    //     imageFile = imageSelected;
    //   });
    // }

    void filePicker() async {
      final selectImage = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = selectImage;
      });
    }

    return SizedBox(
      width: 100,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          imageFile == null
              ? CircleAvatar(
                  radius: 50,
                  //const FlutterLogo()

                  // Image.file(

                  //     File(
                  //       imageFile!.path,
                  //     ),
                  //   ),
                )
              : Image.file(
                  File(
                    imageFile!.path,
                  ),
                ),
          InkWell(
            onTap: () async {
              final selectImage =
                  await _picker.pickImage(source: ImageSource.gallery);
              log(selectImage!.name.toString());
              setState(() {
                imageFile = selectImage;
                log('Main image1: ' + imageFile!.name.toString());
              });
              log('Main image2: ' + imageFile!.path.toString());
            },
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.add_a_photo,
              ),
            ),
          ),
          imageFile != null
              ? Container(
                  height: 50,
                  width: 50,
                  child: Image.file(
                    File(
                      imageFile!.path,
                    ),
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  'null',
                  // style: TextStyle(fontSize: 30),
                ),
        ],
      ),
    );
  }
}
