import 'dart:convert';
import 'dart:io';

import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/api.dart';
import 'package:fastrash/constants/strings.dart';
import 'package:fastrash/repository/backend/history_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/dto/login_dto.dart';
import 'package:fastrash/repository/dto/regisration_dto.dart';
import 'package:fastrash/repository/model/failure_response_model.dart';
import 'package:fastrash/repository/model/login_response_model.dart';
import 'package:fastrash/repository/model/profile_response_model.dart';
import 'package:fastrash/repository/model/registration_sucess_model.dart';
import 'package:fastrash/utils/alerts.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as client;
import 'package:shared_preferences/shared_preferences.dart';

class AuthBackend {
  late SharedPreferences sharedPreferences;


  List<Marker> markers = [];

  late BitmapDescriptor myIcon;


//Single User SignUp
  Future<void> signUpUser(
      BuildContext context, RegistrationDto registrationDto) async {
    const url = http + baseURL + userRegistrationPath;
    logger.i(url);
    logger.i(json.encode({
      "firstName": registrationDto.firstName.toString().trim(),
      "lastName": registrationDto.lastName.toString().trim(),
      "location": DummyData.address.toString(),
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
              "location": DummyData.address.toString(),
              "email": registrationDto.email.toString().trim(),
              "phoneNumber": registrationDto.phoneNumber.toString().trim(),
              "password": registrationDto.password.toString().trim(),
              "passwordConfirm": registrationDto.passwordConfirm.toString().trim(),
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
        showRegisterAlert(context, 'Registration Successful',
            message: 'Proceed to Login', isDismissible: true);
        //navigatePush(context, const LoginScreen());
      } else if (httpConnectionApi.statusCode == 201) {

        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        showFailureAlert(context,"Error Creating Account" ,
            message: ResponseData.failureResponse!.message.toString(), isDismissible: true);
      }
    } on Exception catch (e) {
      displayLongToastMessage(somethingWentWrongText,  );
      logger.e(e);
      rethrow;
    }
  }


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
       /// DummyData.emailAddress = ResponseData.loginResponseModel!.email.toString();
        DummyData.password = loginDto.password.toString();

        DummyData.accessToken =
            ResponseData.loginResponseModel!.token.toString();

        saveUserEmail(loginDto.email);
        saveUserPassword(loginDto.password);

        saveAccessToken(ResponseData.loginResponseModel!.token);

        saveAppTme();
        getUserEmail();
        getUserPassword();
        await fetchProfile(context, ResponseData.loginResponseModel!.id.toString());
       /// navigateReplace(context, const Dashboard());
      } else {
        ///var resBody = jsonDecode(httpConnectionApi.body.toString());
        showFailureAlert(context, 'Login Unsuccessful',
            message: 'Email or Password is incorrect', isDismissible: true);
      }
    } on Exception catch (e) {
      displayLongToastMessage(somethingWentWrongText,  );
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

      logger.i(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.loginResponseModel = LoginResponseModel.fromJson(resBody);
       /// DummyData.emailAddress = ResponseData.loginResponseModel!.email.toString();
        DummyData.accessToken = ResponseData.loginResponseModel!.token.toString();
        logger.wtf(DummyData.accessToken);

        saveUserEmail(loginDto.email);
        saveUserPassword(loginDto.password);
        getUserEmail();

        getUserPassword();
        saveAccessToken(ResponseData.loginResponseModel!.token);
        getAccessToken();
        saveAppTme();
        await fetchProfile(context, ResponseData.loginResponseModel!.id.toString());
      } else {
        navigateReplace(context, const LoginScreen());
      }
    } on Exception catch (e) {
      displayLongToastMessage(somethingWentWrongText,  );

      logger.e(e);
      rethrow;
    }
  }


  Future<void> fetchProfile(BuildContext context, id) async {
    final url = http + baseURL + fetchProfilePath + id;

    logger.i(url);

    try {
      final httpConnectionApi = await client
          .get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: '${DummyData.accessToken}',
        },
      ).timeout(const Duration(seconds: 60));

      logger.i(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.profileResponseModel = ProfileResponseModel.fromJson(resBody);
        logger.w(ResponseData.profileResponseModel);
        await HistoryBackend().fetchAllAlertsOnLogin(context);
      }
    } on Exception catch (e) {
      // displayLongToastMessage(somethingWentWrongText,  );

      logger.e(e);
      rethrow;
    }
  }

  Future<void> resetPassword(BuildContext context, email
      // LoginDto loginDto

      ) async {
    const url = http + baseURL + resetPasswordPath;
    // + ResponseData.loginResponseModel!.id.toString();
    logger.i(url);
    logger.i(json.encode({"email": email.toString().trim()}));

    try {
      final httpConnectionApi = await client
          .post(
            Uri.parse(url),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            },
            body: json.encode({"email": email.toString().trim()}),
          )
          .timeout(const Duration(seconds: 60));

      logger.i(httpConnectionApi.body);
      logger.wtf(httpConnectionApi.statusCode);

      if (httpConnectionApi.statusCode == 200) {
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.loginResponseModel = LoginResponseModel.fromJson(resBody);

        showSuccessAlert(context, 'Email Sent Successfully',
            message:
                'Reset Link has be sent to $email, kindly check your mail to continue',
            isDismissible: true, btnOnePressed: null);

        // await navigatePush(context, LoginScreen());

      } else {
       // var resBody = jsonDecode(httpConnectionApi.body.toString());
        // ResponseData.failureResponse = FailureResponseModel.fromJson(resBody);

        // showErrorAlert(context,
        //     message: "${ResponseData.failureResponse!.message.toString()}");
        // navigateReplace(context, const LoginScreen());
        showFailureAlert(context, 'Account email $email does not exist',
            message:
                'Kindly ensure to input the correct email address for your account.',
            isDismissible: true);
      }
    } on Exception catch (e) {
      displayLongToastMessage(somethingWentWrongText,  );

      logger.e(e);
      rethrow;
    }
  }

  saveUserEmail(localUserEmail) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", localUserEmail);
    logger.i("saved Email Address ${DummyData.emailAddress}");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password ${DummyData.password}");
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
    //logger.i("get Password");
    //logger.i(DummyData.password);
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    //logger.i("saved firstTimeOnApp");
  }

  getUserPhoneNo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.phone = sharedPreferences.getString("Phone");
    //logger.i("get Phone: ${DummyData.phone}");
  }

  saveUserPhoneNo(phone) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Phone", phone);
    //logger.i("saved Phone");
  }

  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
    //logger.i("saved accessToken");
  }

  getAccessToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.accessToken = sharedPreferences.getString("accessToken");
    //logger.i("get accessToken : ${DummyData.accessToken}");
  }
}
