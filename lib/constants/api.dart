//This is where we declare all our api path in form of a string variable
import 'package:fastrash/repository/data/response_data.dart';

const String http = 'https://';

const String baseURL = "fastrash-1337.ew.r.appspot.com";
//const String baseURL = "hdgieucue.myfixbot.com";

/// User Auth
const String userRegistrationPath = "/api/auth/register";
const String userLoginPath = "/api/auth/login";
const String fetchProfilePath = "/api/auth/profile/";
final String userDeletePath ="/api/auth/org/delete/${ResponseData.loginResponseModel!.id}";
const String resetPasswordPath = "/api/auth/resetpassword/";



/// Alerts
const String createUTCAlertsPath ="/api/alerts/create";
const String deleteUTCAlertsPath ="/api/alerts/delete/";
const String updateUTCAlertsPath ="/api/alerts/update/";
const String createCTOAlertsPath ="/api/org/alerts/create";
const String updateCTOAlertsPath ="/api/org/alerts/update/";
const String deleteCTOAlertsPath ="/api/org/alerts/delete/";


/// History

const String depositHistoryPath ="/api/alerts/user/";
const String collectionHistoryPath ="/api/alerts/collector/";
const String allPendingAlertPath ="/api/alerts/?role=user&status=pending";