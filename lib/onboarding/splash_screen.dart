import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/onboarding/onboarding_screen.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    //getCurrentLocation();
    checkUser();

  }


  checkUser() {
    initData().then((onValue) async {
      navigatePush(context, const OnBoardingScreen());
    });
  }


  Future initData() async {
    await Future.delayed(const Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     AppColors.green,
            //     AppColors.yellow,
            //   ],
            // )),
          ),
          Center(
            child: GradientText(
              'Fastrash'.toUpperCase(),
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.ttb,
              radius: .4,
              colors: const [
               AppColors.green,
               AppColors.yellow,
              ],
            ),
          )
        ],
      ),
    );
  }
}
