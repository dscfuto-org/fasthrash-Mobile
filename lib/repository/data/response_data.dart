

import 'package:fastrash/repository/model/alert_create_response_model.dart';
import 'package:fastrash/repository/model/current_location_model.dart';
import 'package:fastrash/repository/model/login_response_model.dart';
import 'package:fastrash/repository/model/organization_registration_sucess_model.dart';
import 'package:fastrash/repository/model/registration_sucess_model.dart';


class ResponseData {
  static RegistrationSuccessModel ? registrationSuccessModel;
  static OrganizationRegistrationSuccessModel? organizationRegistrationSuccessModel;
  static LoginResponseModel? loginResponseModel;
  static AlertCreateResponseModel ? alertCreateResponseModel;
  static CurrentLocationResponseModel? currentLocationResponseModel;
  // static LoginSuccessModel ? loginSuccessModel;
}
