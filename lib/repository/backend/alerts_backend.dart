import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:http/http.dart' as client;

class Alerts {
  Future<void> alerts() async {
    const url = http + baseURL + alertsPath;
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
}
