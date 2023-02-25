import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/onboarding/onboarding_screen.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/dto/login_dto.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:fastrash/utils/device_location.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginDto loginDto = LoginDto();

  late SharedPreferences sharedPreferences;



  @override
  void initState() {
    super.initState();
    //getCurrentLocation();
    DeviceLocation().getCurrentLocation();
    // checkUser();
    checkUserMain();

  }


  checkUser() {
    initData().then((onValue) async {
      navigatePush(context, const OnBoardingScreen());
    });
  }


  checkUserMain() {
    initData().then((onValue) async {
      // logger.d("cedce");
      // navigateReplace(context, OnBoardingScreen());

      sharedPreferences = await SharedPreferences.getInstance();
      DummyData.firstTimeOnApp = sharedPreferences.getBool("firstTimeOnApp");
      logger.v("First time on App? : ${DummyData.firstTimeOnApp}");

      if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null) {
        navigateReplace(context, const OnBoardingScreen());
      } else {
        logger.i("Check User");
        //  DummyData.localUserID = sharedPreferences.getString("UserID");
        DummyData.emailAddress = sharedPreferences.getString("Email");
        DummyData.password = sharedPreferences.getString("Password");

        logger.i("get Password");

        if (DummyData.emailAddress != null && DummyData.password != null) {
          loginDto.email = DummyData.emailAddress;
          loginDto.password = DummyData.password;

          logger.i(DummyData.emailAddress);
          logger.i(DummyData.password);
          submitLogin();
        } else{
          navigateReplace(context, const LoginScreen());
          logger.e("error");
        }
      }
    });
  }

  submitLogin() async {
    logger.i("Call Login API");
    try {
      await AuthBackend().signInAuto(context, loginDto);
    } catch (e) {
      logger.e(e);
      navigateReplace(context, const LoginScreen());
    }
  }
  Future initData() async {
    await Future.delayed(const Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.green,
                AppColors.yellow,
              ],
            )),
          ),
          const Center(
            child: Text(
              'Fastrash',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              // gradientType: GradientType.linear,
              // gradientDirection: GradientDirection.ttb,
              // radius: .4,
              // colors: const [
              //  AppColors.green,
              //  AppColors.yellow,
              // ],
            ),
          )
        ],
      ),
    );
  }
}
