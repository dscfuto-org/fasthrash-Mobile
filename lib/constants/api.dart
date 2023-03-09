//This is where we declare all our api path in form of a string variable
import 'package:fastrash/repository/data/response_data.dart';

const String http = 'https://';

const String baseURL = "fastrash-1337.ew.r.appspot.com";
//const String baseURL = "hdgieucue.myfixbot.com";

/// User Auth
const String userRegistrationPath = "/api/auth/register";
const String userLoginPath = "/api/auth/login";
const String fetchProfilePath = "/api/auth/profile/";
String userDeletePath ="/api/auth/org/delete/${ResponseData.loginResponseModel!.id}";
String resetPasswordPath = "/api/auth/resetpassword/";



/// Alerts
const String createAlertsPath ="/api/alerts/create";
const String getAlertsPath ="/api/alerts/";