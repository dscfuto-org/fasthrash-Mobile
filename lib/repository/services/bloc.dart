
import 'package:fastrash/repository/backend/history_backend.dart';
import 'package:fastrash/repository/model/all_alerts_model.dart';
import 'package:fastrash/repository/model/collections_history_model.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {
  final HistoryRepository _historyRepository = HistoryRepository();


  final BehaviorSubject<List<DepositHistoryModel>> _depositSubject = BehaviorSubject<List<DepositHistoryModel>>();
  final BehaviorSubject<List<CollectionsHistoryModel>> _collectorSubject = BehaviorSubject<List<CollectionsHistoryModel>>();
  final BehaviorSubject<List<AllAlertsResponseModel>> _allAlertsSubject = BehaviorSubject<List<AllAlertsResponseModel>>();


  fetchHistory(context){
    deposit(context);
    collections(context);
    allAlerts(context);
  }

  deposit(context) async {
    List<DepositHistoryModel>? depositHistoryModel =
    await _historyRepository.getDepositHistory();
    _depositSubject.sink.add(depositHistoryModel!);
  }

  collections(context) async {
    List<CollectionsHistoryModel>? collectionsHistoryModel =
    await _historyRepository.getCollectionsHistory();
    _collectorSubject.sink.add(collectionsHistoryModel!);
  }
  allAlerts(context) async {
    List<AllAlertsResponseModel>? allAlertsResponseModel =
    await _historyRepository.getAllAlerts();
    _allAlertsSubject.sink.add(allAlertsResponseModel!);
  }

  dispose() {
    _depositSubject.close();
    _collectorSubject.close();
    _allAlertsSubject.close();
  }

  BehaviorSubject<List<DepositHistoryModel>> get depositSubject => _depositSubject;
  BehaviorSubject<List<CollectionsHistoryModel>> get collectorSubject => _collectorSubject;
  BehaviorSubject<List<AllAlertsResponseModel>> get allAlertsSubject => _allAlertsSubject;
}

final bloc = Bloc();


class HistoryRepository {
  Future<List<DepositHistoryModel>?> getDepositHistory() {
    return HistoryBackend().depositHistory();
  }
  Future<List<CollectionsHistoryModel>?> getCollectionsHistory() {
    return HistoryBackend().collectionHistory();
  }

  Future<List<AllAlertsResponseModel>?> getAllAlerts() {
    return HistoryBackend().fetchAllAlerts();
  }
}

Widget buildErrorWidget(error) {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Connection Error"),
        ],
      ));
}

Widget buildLoadingWidget() {
  return const Center(child: loaderOne);
  // return HistoryLoadingScreen();
}