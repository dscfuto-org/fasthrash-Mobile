import 'dart:io';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/alerts_dto.dart';
import 'package:fastrash/utils/alerts.dart';
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
  File? imageOne;
 /// File? imageTwo;
  final picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey();
  // TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityTextController = TextEditingController();
  TextEditingController locationAddressController = TextEditingController(text:  DummyData.address.toString());
  TextEditingController titleController = TextEditingController();
  TextEditingController esDevTimeController = TextEditingController(text: "5");
  TextEditingController cKPController = TextEditingController();
  AlertsDto alertsDto = AlertsDto();
  var isLoading = false;


  initiateCapture() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        imageOne = File(pickedFile.path);

        ///_imageName = File(pickedFile.name);
        // personalProfileDto.image = base64Encode(
        //   _image!.readAsBytesSync(),
        // );

        logger.wtf('Image Path $imageOne');
        final bytes = imageOne!.readAsBytesSync().lengthInBytes;
        final kb = bytes / 1024;
        logger.v(kb.toString() + "KB");
        logger.i(kb.toString() + "KB");

        ///logger.v(personalProfileDto.image.runtimeType);
        ///updateImageReq();
      } else {}
    });
  }


  @override
  Widget build(BuildContext context) {



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      InkWell(
        onTap: () => initiateCapture(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.green,
              ),

              height:200.h,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  (imageOne != null)
                    ? Image.file(
                  imageOne!,
                  fit: BoxFit.cover,
                )
                    : const Icon(Icons.add_a_photo, color: Colors.white,),
              )),
        ),
      ),
        const SizedBox(
          height: 10,
        ),
         form(),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 3,
        ),
        isLoading ? loaderOne : Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: submitButton(),)
      ],
    );
  }

  form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customButton("Quantity in KG",
              textEditingController: quantityTextController, isDigits: true, decimal: true),
        customButton("Enter Location Address", textEditingController: locationAddressController),

          ResponseData.profileResponseModel!.data!.user!.role == "collector" ? Row(children: [
            SizedBox(width:  MediaQuery.of(context).size.width/2.1,
                child:  customButton("Estimated Delivery time in days",
                    textEditingController: esDevTimeController, isDigits: true, decimal: false ),),
            SizedBox(width:  MediaQuery.of(context).size.width/2.25,
                child:   customButton("Cost per KG in Naira", textEditingController: cKPController,
                    isDigits: true, decimal: false),),

          ],) : Container(),

          customButton("More Descriptions", textEditingController: descriptionController),
        ],
      ),
    );
  }

  submitButton() {
    return AppLargeButton(
        textColor: Colors.white,
        onTap: () {
         if(imageOne != null ){

           _submitRequest();
         } else {
           displayLongToastMessage("Please  Select Image");
         }
        },
        text: "Submit");
  }

  //Control Statement
  Future<void> _submitRequest() async {
    logger.wtf('Alerts');
    FocusScope.of(context).requestFocus(FocusNode());
    if (!_formKey.currentState!.validate()) {
    } else {
      alertsDto.quantity = double.parse(quantityTextController.text);
      alertsDto.address = locationAddressController.text;
      alertsDto.description = descriptionController.text;
      alertsDto.locationlatitude = DeviceLocation.lat;
      alertsDto.locationlongitude = DeviceLocation.lng;
      alertsDto.role = 'user';
      alertsDto.status = 'pending';
      ///image = image;
      // alertsDto.image = _image as String?;

      setState(() {
        isLoading = true;
      });
      logger.wtf('Alerts');
      // logger.wtf("Image::::::: $image");
      // logger.wtf( alertsDto.location);
      try {
        // await Alerts().createAlerts(context, alertsDto, image: );

        if(ResponseData.profileResponseModel!.data!.user!.role.toString() == "user"){
         await AlertsBackend().createUTCAlerts(context, alertsDto, image: imageOne!,  );
        } else {
          await AlertsBackend().createCTOAlerts(context, alertsDto, image: imageOne!,
          deliveryTime:  double.parse(esDevTimeController.text).toInt(), costPerKg: double.parse(cKPController.text).toInt());
        }

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
