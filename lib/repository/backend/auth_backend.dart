import 'dart:convert';
import 'dart:io';

import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/api.dart';
import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/login_dto.dart';
import 'package:fastrash/repository/dto/organization_regisration_dto.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/repository/model/login_response_model.dart';
import 'package:fastrash/repository/model/registration_sucess_model.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as client;
import 'package:shared_preferences/shared_preferences.dart';

class AuthBackend {
  late SharedPreferences sharedPreferences;

//Single User SignUp
  Future<void> signUpUser(BuildContext context,
      RegistrationDto registrationDto) async {
    const url = http + baseURL + userRegistrationPath;
    logger.i(url);
    logger.i(json.encode({
      "firstName": registrationDto.firstName.toString().trim(),
      "lastName": registrationDto.lastName.toString().trim(),
      "location": registrationDto.location.toString().trim(),
      "email": registrationDto.email.toString().trim(),
      "phoneNumber": registrationDto.phoneNumber.toString().trim(),
      "password": registrationDto.password.toString().trim(),
      "passwordConfirm": registrationDto.passwordConfirm.toString().trim(),
      "role": registrationDto.role.toString().trim()
    }));

    try {
      final httpConnectionApi = await client
          .post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({
          "firstName": registrationDto.firstName.toString().trim(),
          "lastName": registrationDto.lastName.toString().trim(),
          "location": registrationDto.location.toString().trim(),
          "email": registrationDto.email.toString().trim(),
          "phoneNumber": registrationDto.phoneNumber.toString().trim(),
          "password": registrationDto.password.toString().trim(),
          "passwordConfirm":
          registrationDto.passwordConfirm.toString().trim(),
          "role": registrationDto.role.toString().trim()
        }),
      )
          .timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 201) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.registrationSuccessModel =
            RegistrationSuccessModel.fromJson(resBody);
        // DummyData.emailAddress =
        //     ResponseData.registrationSuccessModel!.message!.email.toString();
        saveUserEmail(registrationDto.email.toString().trim());
        saveUserPhoneNo(registrationDto.phoneNumber.toString().trim());
        saveUserPassword(registrationDto.password.toString().trim());
        getUserEmail();
        getUserPassword();
        getUserPhoneNo();
        navigatePush(context, const LoginScreen());
      } else {
        ///var resBody = jsonDecode(httpConnectionApi.body.toString());
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

  //Organization SignUp/ Registration
  Future<void> signUpOrganization(
      OrganizationRegistrationDto organizationRegistrationDto) async {
    const url = http + baseURL + organizationRegistrationPath;
    logger.i(url);
    logger.i(json.encode({
      "businessName":
      organizationRegistrationDto.businessName.toString().trim(),
      "location": organizationRegistrationDto.location.toString().trim(),
      "size": organizationRegistrationDto.size.toString().trim(),
      "yearsOfOperation":
      organizationRegistrationDto.yearsOfOperation.toString().trim(),
      "email": organizationRegistrationDto.email.toString().trim(),
      "password": organizationRegistrationDto.password.toString().trim(),
    }));

    try {
      final httpConnectionApi = await client
          .post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({
          "businessName":
          organizationRegistrationDto.businessName.toString().trim(),
          "location":
          organizationRegistrationDto.location.toString().trim(),
          "size": organizationRegistrationDto.size.toString().trim(),
          "yearsOfOperation": organizationRegistrationDto.yearsOfOperation
              .toString()
              .trim(),
          "email": organizationRegistrationDto.email.toString().trim(),
          "password":
          organizationRegistrationDto.password.toString().trim(),
        }),
      )
          .timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      // if (httpConnectionApi.statusCode == 201) {
      //   var resBody = jsonDecode(httpConnectionApi.body.toString());
      //   ResponseData.registrationResponse =
      //       RegistrationSuccessModel.fromJson(resBody);
      //   DummyData.emailAddress =
      //       ResponseData.registrationResponse!.email.toString();
      // } else {
      //   var resBody = jsonDecode(httpConnectionApi.body.toString());
      //   // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

      //   // showErrorAlert(context,
      //   //     message: ResponseData.failureResponse!.message.toString());
      // }
    } on Exception catch (e) {
      // showErrorAlert(context, message: somethingWentWrongText);
      logger.wtf('Error');
      logger.e(e);
      rethrow;
    }
  }

  /*
  LOGIN SESSION FOR
    i) User
    ii) Organization
  */

  // User Login Session

  Future<void> login(BuildContext context, LoginDto loginDto) async {
    const url = http + baseURL + userLoginPath;

    logger.i(url);
    logger.i(json.encode({
      "email": loginDto.email.toString().trim(),
      "password": loginDto.password.toString().trim(),
    }));

    try {
      final httpConnectionApi = await client
          .post(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          "email": loginDto.email.toString().trim(),
          "password": loginDto.password.toString().trim(),
        }),
      )
          .timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      //Here Status Code is Printing 200
      logger.i(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.loginResponseModel = LoginResponseModel.fromJson(resBody);
        DummyData.emailAddress =
            ResponseData.loginResponseModel!.email.toString();
        DummyData.password =
            loginDto.password.toString();

        DummyData.accessToken =  ResponseData.loginResponseModel!.token.toString();

        saveUserEmail(DummyData.emailAddress.toString().trim());

        saveAccessToken(ResponseData.loginResponseModel!.token);
        saveUserPassword(DummyData.password.toString().trim());
        saveAppTme();
        getUserEmail();
        getUserPassword();
        navigatePush(context, const Dashboard());
      } else {
        ///var resBody = jsonDecode(httpConnectionApi.body.toString());
        // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        // showErrorAlert(context,
        //     message: ResponseData.failureResponse!.message.toString());
      }
    } on Exception catch (e) {
      logger.wtf('login Not Working');

      logger.e(e);
      rethrow;
    }
  }

  Future<void> signInAuto(BuildContext context, LoginDto loginDto) async {
    const url = http + baseURL + userLoginPath;

    logger.i(url);
    logger.i(json.encode({
      "email": loginDto.email.toString().trim(),
      "password": loginDto.password.toString().trim(),
    }));

    try {
      final httpConnectionApi = await client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',

        },
        body: json.encode({
          "email": loginDto.email.toString().trim(),
          "password": loginDto.password.toString().trim(),
        }),
      ).timeout(const Duration(seconds: 60));

      logger.i(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 201) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.loginResponseModel = LoginResponseModel.fromJson(resBody);
        DummyData.emailAddress =
            ResponseData.loginResponseModel!.email.toString();
        DummyData.accessToken =
            ResponseData.loginResponseModel!.token.toString();
        logger.wtf(DummyData.accessToken);


        saveUserEmail(loginDto.email);
        getUserEmail();
        saveUserPassword(loginDto.password);
        getUserPassword();
        saveAccessToken(ResponseData.loginResponseModel!.token);
        getAccessToken();
        saveAppTme();

        navigatePush(context, const Dashboard());


      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        // showErrorAlert(context,
        //     message: "${ResponseData.failureResponse!.message.toString()}");
        navigateReplace(context, const LoginScreen());

      }
    } on Exception catch (e) {
      // displayLongToastMessage(somethingWentWrongText,  );

      logger.e(e);
      rethrow;
    }
  }

  saveUserEmail(localUserEmail) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", localUserEmail);
    logger.i("saved Email Address");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password");

  }

  getUserEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.emailAddress = sharedPreferences.getString("Email");
    logger.i("get Email Address");
    logger.i(DummyData.emailAddress);
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password");
    logger.i(DummyData.password);
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    logger.i("saved firstTimeOnApp");
  }

  getUserPhoneNo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.phone = sharedPreferences.getString("Phone");
    logger.i("get Phone: ${DummyData.phone}");
  }

  saveUserPhoneNo(phone) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Phone", phone);
    logger.i("saved Phone");
  }

  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
    logger.i("saved accessToken");
  }

  getAccessToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.accessToken = sharedPreferences.getString("accessToken");
    logger.i("get accessToken : ${DummyData.accessToken}");
  }
}
