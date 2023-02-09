import 'dart:convert';
import 'dart:io';

import 'package:fastrash/constants/api.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/login_dto.dart';
import 'package:fastrash/repository/dto/organization_regisration_dto.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/repository/model/registration_sucess_model.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:shared_preferences/shared_preferences.dart';

class AuthBackend {
  late SharedPreferences sharedPreferences;

//Single User SignUp
  Future<void> signUpUser(
    RegistrationDto registrationDto,
  ) async {
    const url = http + baseURL + userRegistrationPath;
    logger.i(url);
    logger.i(json.encode({
      "firstName": registrationDto.firstName.toString().trim(),
      "lastName": registrationDto.lastName.toString().trim(),
      "location": registrationDto.location.toString().trim(),
      "email": registrationDto.email.toString().trim(),
      "phoneNumber": registrationDto.phoneNumber.toString().trim(),
      "password": registrationDto.password.toString().trim(),
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
              "role": registrationDto.role.toString().trim()
            }),
          )
          .timeout(const Duration(seconds: 60));

      logger.w(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 201) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.registrationResponse =
            RegistrationSuccessModel.fromJson(resBody);
        DummyData.emailAddress =
            ResponseData.registrationResponse!.email.toString();
      } else {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
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

  Future<void> login(LoginDto loginDto) async {
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
    } on Exception catch (e) {
      logger.wtf('login Not Working');

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
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password");
  }
}
