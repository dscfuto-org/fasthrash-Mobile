import 'dart:io';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/dto/alerts_dto.dart';
import 'package:fastrash/utils/buttons.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/device_location.dart';
import 'package:fastrash/utils/loaders.dart';
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
 File? image;
  final picker = ImagePicker();
  bool useLocation = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  // TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityTextController = TextEditingController();
  TextEditingController locationAddressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  AlertsDto alertsDto = AlertsDto();
  var isLoading = false;
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
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);

          ///_imageName = File(pickedFile.name);
          // personalProfileDto.image = base64Encode(
          //   _image!.readAsBytesSync(),
          // );

          logger.wtf('Image Path $image');
          final bytes = image!.readAsBytesSync().lengthInBytes;
          final kb = bytes / 1024;
          logger.v(kb.toString() + "KB");
          logger.i(kb.toString() + "KB");

          ///logger.v(personalProfileDto.image.runtimeType);
          ///updateImageReq();
        } else {}
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => initiateCapture(),
          child: CircleAvatar(
            radius: 70.r,
            backgroundColor: AppColors.green,
            child: SizedBox(
                height: 160.h,
                width: 160.w,
                child: ClipOval(
                  child: (image != null)
                      ? Image.file(
                          image!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.add_a_photo),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // customButton("Title", textEditingController: titleController),
        // customButton("Quantity in KG", textEditingController: quantityTextController),
        // customButton("Description", textEditingController: descriptionController),
        // useLocation ? Container() : customButton("Enter Address", textEditingController: locationAddressController),
        form(),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.white,
          child: SwitchListTile(
            title: Text(
              'Use Current Address',
              style: TextStyle(fontSize: 14.sp),
            ),
            value: useLocation,
            activeColor: AppColors.yellow,
            inactiveTrackColor: Colors.grey,
            onChanged: (bool value) {
              setState(() {
                useLocation = value;
              });
            },
            secondary: const Icon(
              Icons.location_on,
              color: AppColors.yellow,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        isLoading ? loaderOne : submitButton()
      ],
    );
  }

  form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          customButton("Quantity in KG",
              textEditingController: quantityTextController, isDigits: true),

          useLocation
              ? Container()
              : customButton("Enter Location Address",
                  textEditingController: locationAddressController),


        ],
      ),
    );
  }

  submitButton() {
    return AppLargeButton(
        textColor: Colors.white,
        onTap: () {
          _submitRequest();
        },
        text: "Submit");
  }

  //Control Statement
  Future<void> _submitRequest() async {
    logger.wtf('Alerts');
    FocusScope.of(context).requestFocus(FocusNode());
    if (!_formKey.currentState!.validate()) {
    } else {
      alertsDto.quantity = int.parse(quantityTextController.text);
      alertsDto.address = useLocation?"${DeviceLocation.lat} ${DeviceLocation.lng}": locationAddressController.text;
      alertsDto.locationlatitude = DeviceLocation.lat;
      alertsDto.locationlongitude = DeviceLocation.lng;
      alertsDto.status = 'pending';
      image = image;
      // alertsDto.image = _image as String?;

      setState(() {
        isLoading = true;
      });
      logger.wtf('Alerts');
      logger.wtf("Image::::::: $image");
      logger.wtf( alertsDto.quantity);
      logger.wtf( alertsDto.address);
      try {

        // await Alerts().createAlerts(context, alertsDto, image: );
        await Alerts().createAlerts(context, alertsDto,  image!);


      } catch (e) {
        setState(() {
          isLoading = false;
        });

        rethrow;
      }

      setState(() {
        isLoading = false;
      });
    }
  }
}
