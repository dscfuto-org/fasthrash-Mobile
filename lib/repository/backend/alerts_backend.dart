import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/alerts_dto.dart';
import 'package:fastrash/repository/model/failure_response_model.dart';
import 'package:fastrash/repository/services/bloc.dart';
import 'package:fastrash/utils/alerts.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

class AlertsBackend {
  Future<void> createUTCAlerts(
    BuildContext context, AlertsDto alertsDto, File image,
  ) async {
    const url = http + baseURL + createUTCAlertsPath;
    logger.i(url);

    try {
      final request = client.MultipartRequest("POST", Uri.parse(url),);
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
      };
      Map<String, String> field = {
          "description": "I have some waste at ${alertsDto.address} that needs to be collected, it weighs about ${alertsDto.quantity} kg...",
          "status": alertsDto.status.toString(),
          "userId": ResponseData.profileResponseModel!.data!.user!.id.toString(),
          "quantity": int.parse(alertsDto.quantity.toString()).toString(),
          "location.longitude": alertsDto.locationlongitude.toString(),
          "location.latitude": alertsDto.locationlatitude.toString(),
          "address": alertsDto.address.toString(),
          "role": ResponseData.profileResponseModel!.data!.user!.role.toString(),
      };

      request.headers.addAll(headers);
      var imageMultipartFile = await client.MultipartFile.fromPath(
          'images', image.path,
          filename: image.path.split("/").last);

      request.files.add(imageMultipartFile);
      request.fields.addAll(field);
      logger.wtf(imageMultipartFile);
      var response =await request.send();

      //for getting and decoding the response into json format
      var responseD = await client.Response.fromStream(response);
      // final responseData = json.decode(responseD.body);
      logger.wtf(responseD.statusCode);
      logger.wtf(responseD.body);
      if (responseD.statusCode == 201) {
        await bloc.fetchHistory(context);
        showSuccessAlert(context, "Success", message: "Alert Created Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));
      } else {

        var resBody = jsonDecode(responseD.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        showFailureAlert(context,"Error Creating Alert" ,
            message: ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }

  Future<void> createCTOAlerts(
      BuildContext context, AlertsDto alertsDto, File image,
      ) async {
    const url = http + baseURL + createCTOAlertsPath;
    logger.i(url);

    try {
      final request = client.MultipartRequest("POST", Uri.parse(url),);
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
      };
      Map<String, String> field = {
        "description": "I have some waste at ${alertsDto.address} that needs to be collected, it weighs about ${alertsDto.quantity} kg...",
        "status": alertsDto.status.toString(),
        "userId": ResponseData.profileResponseModel!.data!.user!.id.toString(),
        "quantity": int.parse(alertsDto.quantity.toString()).toString(),
        "location.longitude": alertsDto.locationlongitude.toString(),
        "location.latitude": alertsDto.locationlatitude.toString(),
        "address": alertsDto.address.toString(),
        "role": ResponseData.profileResponseModel!.data!.user!.role.toString(),
      };

      request.headers.addAll(headers);
      var imageMultipartFile = await client.MultipartFile.fromPath(
          'images', image.path,
          filename: image.path.split("/").last);

      request.files.add(imageMultipartFile);
      request.fields.addAll(field);
      logger.wtf(imageMultipartFile);
      var response =await request.send();

      //for getting and decoding the response into json format
      var responseD = await client.Response.fromStream(response);
      // final responseData = json.decode(responseD.body);
      logger.wtf(responseD.statusCode);
      logger.wtf(responseD.body);
      if (responseD.statusCode == 201) {
        await bloc.fetchHistory(context);
        showSuccessAlert(context, "Success", message: "Alert Created Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));
       ///
      } else {

        var resBody = jsonDecode(responseD.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        showFailureAlert(context,"Error Creating Alert" ,
            message: ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage(somethingWentWrongText, context);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }

  Future<void> deleteUTCAlert(BuildContext context, alertId) async {
    final url = http + baseURL +  deleteUTCAlertsPath + alertId;

    logger.i(url);

    try {
      final httpConnectionApi = await client.delete(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
        // body: json.encode({
        //   "id":alertId.toString(),
        // }),
      ).timeout(const Duration(seconds: 60));

      logger.v(httpConnectionApi.body);
      logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 201) {
       await bloc.fetchHistory(context);
       showSuccessAlert(context, "Success", message: "Alert Deleted Successfully",
           isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));

      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
        showFailureAlert(context,"Error Deleting Alert" ,
            message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage( somethingWentWrongText, context );

      print(e);
      rethrow;
    }
  }

  Future<void> deleteCTOAlert(BuildContext context, alertId) async {
    final url = http + baseURL +  deleteCTOAlertsPath + alertId;

    logger.i(url);

    try {
      final httpConnectionApi = await client.delete(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
        // body: json.encode({
        //   "_id": alertId.toString(),
        // }),
      ).timeout(const Duration(seconds: 60));

      logger.v(httpConnectionApi.body);
      logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 201) {
        await bloc.fetchHistory(context);
        showSuccessAlert(context, "Success", message: "Alert Deleted Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));

      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
        showFailureAlert(context,"Error Deleting Alert" ,
            message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage( somethingWentWrongText, context );
      print(e);
      rethrow;
    }
  }


  // Future<void> updateCTOAlert(BuildContext context, {required String alertId,
  //   required String collectorId, required String status, }) async {
  //   final url = http + baseURL +  updateCTOAlertsPath + alertId;
  //
  //   logger.i(url);
  //
  //   try {
  //     final httpConnectionApi = await client.put(
  //       Uri.parse(url),
  //       headers: {
  //         HttpHeaders.contentTypeHeader: 'application/json',
  //         HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
  //       },
  //       body: json.encode({
  //         "userId":collectorId.toString(),
  //         "status":status.toString(),
  //       }),
  //     ).timeout(const Duration(seconds: 60));
  //
  //     logger.v(httpConnectionApi.body);
  //     logger.v(httpConnectionApi.statusCode);
  //
  //     if (httpConnectionApi.statusCode == 200) {
  //       await bloc.fetchHistory(context);
  //
  //       displayLongToastMessage("Alert is updated to ${status.toUpperCase()} successfully");
  //
  //     } else {
  //       var resBody = jsonDecode(httpConnectionApi.body.toString());
  //       ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
  //       showFailureAlert(context,"Error Updating Alert" ,
  //           message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
  //     }
  //   } on Exception catch (e) {
  //     displayShortToastMessage( somethingWentWrongText, context );
  //
  //     logger.e(e);
  //     rethrow;
  //   }
  // }

  Future<void> updateUTCAlert(BuildContext context, {required String alertId,
    required String status,
    required String collectorId,
    required String userId,
  }) async {
    final url = http + baseURL +  updateUTCAlertsPath + alertId;

    logger.i(url);

    print(json.encode({
      "collectorId":collectorId.toString(),
      "status":status.toString(),
      "userId":userId.toString(),
    }));


    try {
      final httpConnectionApi = await client.put(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
        body: json.encode({
          "collectorId":collectorId.toString(),
          "status":status.toString(),
          "userId":userId.toString(),
        }),
      ).timeout(const Duration(seconds: 60));

      logger.v(httpConnectionApi.body);
      logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        await bloc.fetchHistory(context);

        showSuccessAlert(context, "Success", message: "Alert ${status.toUpperCase()} Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));

      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
        showFailureAlert(context,"Error Updating Alert" ,
            message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage( somethingWentWrongText, context );

      logger.e(e);
      rethrow;
    }
  }


  Future<void> updateUTCAlertToCollected(BuildContext context, {required String alertId,
    required String status,
    required String userId,
  }) async {
    final url =  http + baseURL +  "/api/alerts/user/update/"  + alertId ;

    logger.i(url);

    print(json.encode({
      "status":status.toString(),
      "userId":userId.toString(),
    }));


    try {
      final httpConnectionApi = await client.put(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
        body: json.encode({
          "status":status.toString(),
          "userId":userId.toString(),
        }),
      ).timeout(const Duration(seconds: 60));

      logger.v(httpConnectionApi.body);
      logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        await bloc.fetchHistory(context);
        showSuccessAlert(context, "Success", message: "Alert ${status.toUpperCase()} Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));
      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
        showFailureAlert(context,"Error Updating Alert" ,
            message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage( somethingWentWrongText, context );

      logger.e(e);
      rethrow;
    }
  }


  Future<void> updateCTOAlertToCollected(BuildContext context, {required String alertId,
    required String status,
    required String collectorId,
  }) async {
    final url =  http + baseURL +  "/api/org/alerts/collector/update/"  + alertId ;

    logger.i(url);

    print(json.encode({
      "status":status.toString(),
      "userId":collectorId.toString(),
    }));


    try {
      final httpConnectionApi = await client.put(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
        body: json.encode({
          "status":status.toString(),
          "userId":collectorId.toString(),
        }),
      ).timeout(const Duration(seconds: 60));

      logger.v(httpConnectionApi.body);
      logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        await bloc.fetchHistory(context);
        showSuccessAlert(context, "Success", message: "Alert ${status.toUpperCase()} Successfully",
            isDismissible: true, btnOnePressed: navigateReplace(context, const Dashboard()));
      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);
        showFailureAlert(context,"Error Updating Alert" ,
            message:  ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayShortToastMessage( somethingWentWrongText, context );

      logger.e(e);
      rethrow;
    }
  }






}