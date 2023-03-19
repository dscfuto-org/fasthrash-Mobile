import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/model/all_alerts_model.dart';
import 'package:fastrash/repository/model/collections_history_model.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/repository/services/bloc.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:http/http.dart' as client;


class HistoryBackend{



  Future<List<AllAlertsResponseModel>?> fetchAllAlerts(context) async {
    const url = http + baseURL  + allPendingAlertPath;

    logger.i(url);

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',

        },
      ).timeout(const Duration(seconds: 60));
      //
     /// logger.v(httpConnectionApi.body);
      // logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ///logger.wtf(resBody["data"]["alert"]);

        ResponseData.allAlertsResponseModel = (resBody["data"]["alert"] as List)
            .map((e) => AllAlertsResponseModel.fromJson(e)).toList();

        logger.wtf(ResponseData.allAlertsResponseModel);
      }
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
    return ResponseData.allAlertsResponseModel;
  }


  Future<List<DepositHistoryModel>?> depositHistory() async {
    final url = http + baseURL  + depositHistoryPath + ResponseData.profileResponseModel!.data!.user!.id.toString();

    logger.i(url);

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',

        },
      ).timeout(const Duration(seconds: 60));
      //
     /// logger.v(httpConnectionApi.body);
      // logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ///logger.wtf(resBody["data"]["alert"]);

        ResponseData.depositHistoryModel = (resBody["data"]["alert"] as List)
            .map((e) => DepositHistoryModel.fromJson(e)).toList();

      }
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
   return ResponseData.depositHistoryModel;
  }

  Future<List<CollectionsHistoryModel>?> collectionHistory() async {
    final url = http + baseURL  + collectionHistoryPath + ResponseData.profileResponseModel!.data!.user!.id.toString();

    logger.i(url);

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',

        },
      ).timeout(const Duration(seconds: 60));
      //
     /// logger.v(httpConnectionApi.body);
      // logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ///logger.wtf(resBody["data"]["alert"]);

        ResponseData.collectionsHistoryModel = (resBody["data"]["alert"] as List)
            .map((e) => CollectionsHistoryModel.fromJson(e)).toList();

      ///  logger.wtf(ResponseData.collectionsHistoryModel);
      }
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
   return ResponseData.collectionsHistoryModel;
  }


  Future<List<AllAlertsResponseModel>?> fetchAllAlertsOnLogin(context) async {
    const url = http + baseURL  + allPendingAlertPath;

    logger.i(url);

    try {
      final httpConnectionApi = await client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',

        },
      ).timeout(const Duration(seconds: 60));
      //
      /// logger.v(httpConnectionApi.body);
      // logger.v(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ///logger.wtf(resBody["data"]["alert"]);

        ResponseData.allAlertsResponseModel = (resBody["data"]["alert"] as List)
            .map((e) => AllAlertsResponseModel.fromJson(e)).toList();

        logger.wtf(ResponseData.allAlertsResponseModel);

        if(ResponseData.allAlertsResponseModel != []){
          await bloc.fetchHistory(context);

          /// DummyData.emailAddress = ResponseData.loginResponseModel!.email.toString();
          navigateReplace(context, const Dashboard());
        } else {fetchAllAlertsOnLogin(context);}
      }
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
    return ResponseData.allAlertsResponseModel;
  }

}