import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:http/http.dart' as client;

class Alerts {
  Future<void> createAlerts() async {
    const url = http + baseURL + createAlertsPath;
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
      final httpConnectionApi = await client
          .post(
            Uri.parse(url),
            headers: {HttpHeaders.contentTypeHeader: 'application/json'},
            body: json.encode({
              "title": "Need to dispose some waste",
              "description":
                  "I have some waste at [location] that needs to be collected, it weighs about [weight] kg...",
              "image":
                  "https://storage.googleapis.com/fastrash-image-upload/66988091.jpg",
              "location": "121.13",
              "quantity": 7
            }),
          )
          .timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);
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
      final httpConnectionApi = await client
          .get(
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
      )
          .timeout(const Duration(seconds: 60));

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
    final url = http + baseURL + getAlertsPath+ ResponseData.loginResponseModel!.id.toString();
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
      final httpConnectionApi = await client
          .get(
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
      )
          .timeout(const Duration(seconds: 60));

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
