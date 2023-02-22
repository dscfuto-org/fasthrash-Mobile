import 'dart:io';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({
    super.key,
  });

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {

  File? _image;
  final picker = ImagePicker();
  bool useLocation = false;
  
  @override
  Widget build(BuildContext context) {

    // void pickImage() async {
    //   final imageSelected =
    //       //  await ImagePickerHelper.pickImageFromGallery();
    //       await _picker.pickImage(source: ImageSource.camera);
    //   setState(() {
    //     imageFile = imageSelected;
    //   });
    // }

    // void filePicker() async {
    //   final selectImage = await _picker.pickImage(source: ImageSource.gallery);
    //   setState(() {
    //     imageFile = selectImage;
    //   });
    // }


    initiateCapture() async {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50

      );

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          ///_imageName = File(pickedFile.name);
          // personalProfileDto.image = base64Encode(
          //   _image!.readAsBytesSync(),
          // );
          logger.v('Image Path $_image');
          final bytes = _image!.readAsBytesSync().lengthInBytes;
          final kb = bytes / 1024;
          logger.v(kb.toString() + "KB");
          ///logger.v(personalProfileDto.image.runtimeType);
          ///updateImageReq();
        } else {}
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=> initiateCapture(),
          child: CircleAvatar(
            radius: 70.r,
            backgroundColor: AppColors.green,
            child: SizedBox(
                height: 160.h, width: 160.w,
                child: ClipOval(
                  child: (_image != null)
                      ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )   :
                  const Icon(Icons.add_a_photo),
                )
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        customButton("Quantity in KG"),
        customButton("Description"),
        useLocation ? Container() : customButton("Enter Address"),

        const SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.white,
          child: SwitchListTile(
            title: Text('Use Current Address',style: TextStyle(fontSize: 14.sp),),
            value: useLocation,
            activeColor: AppColors.yellow,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool value) {
              setState(() {
                useLocation = value;
              });
            },
            secondary: const Icon(Icons.location_on, color: AppColors.yellow,),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
      ],
    );
  }
}
