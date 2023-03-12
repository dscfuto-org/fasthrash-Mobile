import 'package:fastrash/repository/model/all_alerts_model.dart';
import 'package:fastrash/repository/model/collections_history_model.dart';
import 'package:fastrash/repository/model/current_location_model.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/repository/model/failure_response_model.dart';
import 'package:fastrash/repository/model/login_response_model.dart';
import 'package:fastrash/repository/model/profile_response_model.dart';
import 'package:fastrash/repository/model/registration_sucess_model.dart';


class ResponseData {
  static RegistrationSuccessModel ? registrationSuccessModel;
  static LoginResponseModel? loginResponseModel;
  static CurrentLocationResponseModel? currentLocationResponseModel;
  static ProfileResponseModel? profileResponseModel;
  static FailureResponseModel ? failureResponse;
  static List<DepositHistoryModel> depositHistoryModel  = [];
  static List<CollectionsHistoryModel> collectionsHistoryModel  = [];
  static List<AllAlertsResponseModel> allAlertsResponseModel  = [];
}
