import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/alerts_dto.dart';
import 'package:fastrash/utils/alerts.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

class Alerts {
  Future<void> createAlerts(
    BuildContext context,
    AlertsDto alertsDto,
    File image,
  ) async {
    const url = http + baseURL + createAlertsPath;
    var httpConnectionApi;
    logger.i(url);
    logger.i(json.encode({
      "description":
          "I have some waste at ${alertsDto.address} that needs to be collected, it weighs about ${alertsDto.quantity} kg...",
      "status": alertsDto.status.toString(),
      "image": image,
      "address": alertsDto.address.toString(),
      "location.longitude": alertsDto.locationlongitude.toString(),
      "location.latitude": alertsDto.locationlatitude.toString(),
      "role": ResponseData.loginResponseModel!.role.toString(),
      "quantity": alertsDto.quantity.toString()
    }));

    try {
      final request = client.MultipartRequest(
        "POST",
        Uri.parse(url),
      );
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        'accept': 'application/json',
      };

      request.headers.addAll(headers);
      var imageMultipartFile = await client.MultipartFile.fromPath(
          'image', image.path,
          filename: image.path.split("/").last);

      request.files.add(imageMultipartFile);
      logger.wtf(imageMultipartFile);
      request.fields['description'] =
          "I have some waste at ${alertsDto.address} that needs to be collected, it weighs about ${alertsDto.quantity} kg...";
      request.fields['status'] = alertsDto.status.toString();
      request.fields['address'] = alertsDto.address.toString();
      request.fields['quantity'] = alertsDto.quantity.toString();
      request.fields['location.longitude'] = alertsDto.locationlongitude.toString();
      request.fields['location.latitude'] = alertsDto.locationlatitude.toString();
      request.fields['role'] = ResponseData.loginResponseModel!.role.toString();
      var response = await request.send();
      //for getting and decoding the response into json format
      var responseD = await client.Response.fromStream(response);
      final responseData = json.decode(responseD.body);
      httpConnectionApi = responseD.statusCode;
      logger.wtf(httpConnectionApi);
      logger.wtf(responseD.body);
      if (httpConnectionApi == 200 || httpConnectionApi == 201) {
        showFailureAlert(context, 'Success',
            message: 'Kindly provide another email', isDismissible: true);
      } else {
        showFailureAlert(context, 'Alert creation failed',
            message: 'Kindly select an Image to upload', isDismissible: true);
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        // showErrorAlert(context,
        //     message: ResponseData.failureResponse!.message.toString());
      }
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }

  //Get Alerts

  Future<void> getAlerts() async {
    const url = http + baseURL + getAlertsPath;
    logger.i(url);
    logger.i(json.encode({
      "title": "Need to dispose some waste",
      "description":
          "I have some waste at [location] that needs to be collected, it weighs about [weight] kg...",
      "image":
          "https://storage.googleapis.com/fastrash-image-upload/66988091.jpg",
      "location": "121.13, 32.1",
      "quantity": 7
    }));

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        // body: json.encode({
        //   "title": "Need to dispose some waste",
        //   "description":
        //   "I have some waste at [location] that needs to be collected, it weighs about [weight] kg...",
        //   "image":
        //   "https://storage.googleapis.com/fastrash-image-upload/66988091.jpg",
        //   "location": "121.13",
        //   "quantity": 7
        // }),
      ).timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }

  Future<void> getAlertsId() async {
    final url = http +
        baseURL +
        getAlertsPath +
        ResponseData.loginResponseModel!.id.toString();
    logger.i(url);
    logger.i(json.encode({
      "title": "Need to dispose some waste",
      "description":
          "I have some waste at [location] that needs to be collected, it weighs about [weight] kg...",
      "image":
          "https://storage.googleapis.com/fastrash-image-upload/66988091.jpg",
      "location": "121.13, 32.1",
      "quantity": 7
    }));

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        // body: json.encode({
        //   "title": "Need to dispose some waste",
        //   "description":
        //   "I have some waste at [location] that needs to be collected, it weighs about [weight] kg...",
        //   "image":
        //   "https://storage.googleapis.com/fastrash-image-upload/66988091.jpg",
        //   "location": "121.13",
        //   "quantity": 7
        // }),
      ).timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }
}

// class KYCBackend {
//   Future<void> updateFirstKYC(BuildContext context,
//       {required File document,
//       required File selfie,
//       required String docType}) async {
//     const url = http + baseURL + submitFirstKYCReqPath;
//     //logger.wtf(url);
//
//     var httpConnectionApi;
//     //logger.i(url);
//
//     try {
//       final request = client.MultipartRequest(
//         "POST",
//         Uri.parse(url),
//       );
//       Map<String, String> headers = {
//         "Content-Type": "multipart/form-data",
//         'accept': 'application/json',
//         "Authorization": authToken
//       };
//
//       request.headers.addAll(headers);
//
//       // multipart that takes file from path
//       var docMultipartFile = await client.MultipartFile.fromPath(
//           'document', document.path,
//           filename: document.path.split("/").last);
//       var selfieMultipartFile = await client.MultipartFile.fromPath(
//           'selfie', selfie.path,
//           filename: selfie.path.split("/").last);
//
//       request.fields['ide'] = ResponseData.loginResponse!.data!.ide.toString();
//       request.fields['type'] = docType.toString();
//       // add file to multipart
//       request.files.add(docMultipartFile);
//       request.files.add(selfieMultipartFile);
//
//       //logger.i(request.fields);
//
//       var response = await request.send();
//
//       //for getting and decoding the response into json format
//       var responseD = await client.Response.fromStream(response);
//       final responseData = json.decode(responseD.body);
//       httpConnectionApi = responseD.statusCode;
//
//       // logger.v(responseData);
//       // logger.v(httpConnectionApi);
//
//       if (httpConnectionApi == 200 || httpConnectionApi == 201) {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//         displaySuccessToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//         navigateBack(context);
//       } else {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//
//         displayFailureToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//       }
//     } on Exception catch (e) {
//       displayFailureToastMessage(message: somethingWentWrongText);
//       print(e);
//       throw e;
//     }
//   }
//
//   Future<void> updateSecondKYC(BuildContext context,
//       {required File document, required String docType}) async {
//     const url = http + baseURL + submitSecondKYCReqPath;
//
//     /// logger.wtf(url);
//
//     var httpConnectionApi;
//
//     ///logger.i(url);
//     try {
//       final request = client.MultipartRequest(
//         "POST",
//         Uri.parse(url),
//       );
//       Map<String, String> headers = {
//         "Content-Type": "multipart/form-data",
//         'accept': 'application/json',
//         "Authorization": authToken
//       };
//
//       request.headers.addAll(headers);
//
//       // multipart that takes file from path
//       var docMultipartFile = await client.MultipartFile.fromPath(
//           'document', document.path,
//           filename: document.path.split("/").last);
//
//       ///var selfieMultipartFile = await client.MultipartFile.fromPath('selfie', selfie.path, filename: selfie.path.split("/").last);
//
//       request.fields['ide'] = ResponseData.loginResponse!.data!.ide.toString();
//       request.fields['type'] = docType.toString();
//       // add file to multipart
//       request.files.add(docMultipartFile);
//
//       ///request.files.add(selfieMultipartFile);
//
//       //logger.i(request.fields);
//
//       var response = await request.send();
//
//       //for getting and decoding the response into json format
//       var responseD = await client.Response.fromStream(response);
//       final responseData = json.decode(responseD.body);
//       httpConnectionApi = responseD.statusCode;
//
//       // logger.v(responseData);
//       // logger.v(httpConnectionApi);
//
//       if (httpConnectionApi == 200 || httpConnectionApi == 201) {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//         displaySuccessToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//         navigateBack(context);
//       } else {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//
//         displayFailureToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//       }
//     } on Exception catch (e) {
//       displayFailureToastMessage(message: somethingWentWrongText);
//       print(e);
//       throw e;
//     }
//   }
//
//   Future<void> updateThirdKYC(
//     BuildContext context, {
//     required File document,
//     required String email,
//     required String fullName,
//     required String phone,
//   }) async {
//     const url = http + baseURL + submitThirdKYCReqPath;
//     //logger.wtf(url);
//
//     var httpConnectionApi;
//     //logger.i(url);
//     try {
//       final request = client.MultipartRequest(
//         "POST",
//         Uri.parse(url),
//       );
//       Map<String, String> headers = {
//         "Content-Type": "multipart/form-data",
//         'accept': 'application/json',
//         "Authorization": authToken
//       };
//
//       request.headers.addAll(headers);
//
//       // multipart that takes file from path
//       var docMultipartFile = await client.MultipartFile.fromPath(
//           'image', document.path,
//           filename: document.path.split("/").last);
//
//       request.fields['ide'] = ResponseData.loginResponse!.data!.ide.toString();
//       request.fields['fullname'] = fullName.toString();
//       request.fields['email'] = email.toString();
//       request.fields['phone_number'] = phone.toString();
//       // add file to multipart
//       request.files.add(docMultipartFile);
//
//       // logger.i(request.fields);
//       // logger.i(request.files);
//
//       var response = await request.send();
//
//       //for getting and decoding the response into json format
//       var responseD = await client.Response.fromStream(response);
//       final responseData = json.decode(responseD.body);
//       httpConnectionApi = responseD.statusCode;
//
//       // logger.v(responseData);
//       // logger.v(httpConnectionApi);
//
//       if (httpConnectionApi == 200 || httpConnectionApi == 201) {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//         displaySuccessToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//         navigateBack(context);
//       } else {
//         ResponseData.failureResponse =
//             FailureResponseModel.fromJson(responseData);
//
//         displayFailureToastMessage(
//             message: ResponseData.failureResponse!.message.toString());
//       }
//     } on Exception catch (e) {
//       displayFailureToastMessage(message: somethingWentWrongText);
//       print(e);
//       throw e;
//     }
//   }
// }
