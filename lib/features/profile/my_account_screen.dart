import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/backend/auth_backend.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.green,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      // backgroundColor: Colors.deepOrange,

      body: Stack(
        children: <Widget>[
          Container(),
          Container(
            height: deviceH / 3.5,
            decoration: const BoxDecoration(color: AppColors.green),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: deviceH / 15,
                      child: Icon(
                        Icons.person,
                        size: 50.r,
                      ),
                      // backgroundImage: AssetImage(
                      //   assetUserIcon,
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ResponseData.loginResponseModel!.firstName.toString()+" "+ResponseData.loginResponseModel!.lastName.toString(),
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),

                  // SmoothStarRating(
                  //   rating: 3,
                  //   color: AppColors.yellow,
                  //   allowHalfRating: true,
                  //   starCount: 5,
                  //   size: 20,
                  //   borderColor: AppColors.yellow,
                  //   ///isReadOnly: true,
                  // ),
                  // Text("Neon Taxi", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),)
                ],
              ),
            ),
          ),

          Positioned(
              top: deviceH / 3.2,
              child: SizedBox(
                  width: deviceW,
                  height: deviceH / 1.65,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      buildTile(
                          Icons.person, "Name",  ResponseData.loginResponseModel!.firstName.toString()+" "+ResponseData.loginResponseModel!.lastName.toString(), context),
                      buildTile(
                          Icons.phone, "Phone Number", ResponseData.loginResponseModel!.phoneNumber.toString(), context),
                      buildTile(Icons.email, "Email", ResponseData.loginResponseModel!.email.toString(),
                          context),
                      buildTile(
                          Icons.email, "Location",   ResponseData.loginResponseModel!.location.toString(), context),
                    ],
                  ))),
          Positioned(
            left: 0,
            top: deviceH / 3.2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                "Account Info",
                style: TextStyle(
                    fontSize: deviceW / 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
            ),
          ),
          Positioned(
              top: deviceH / 4,
              left: deviceW / 4,
              child: SizedBox(
                width: deviceW / 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [AppColors.yellow, AppColors.yellow])),
                  child: InkWell(
                    onTap: (){
                      AuthBackend().resetPassword(context,);
                    },
                    child: const Text(
                      "Collector",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )),

          // Positioned(
          //     top: deviceH/9.4,
          //     right: deviceW/2.9,
          //     child: InkWell(
          //       onTap: ()=> null,
          //       child: Container(
          //        // width: deviceW/2,
          //         child:  CircleAvatar(
          //           child: Icon(Icons.edit),
          //         ),
          //       ),
          //     )
          // ),
          // InkWell(
          //     onTap: (){
          //       AuthBackend().deleteAcc();
          //     },
          //     child: Text('Test delete',))
        ],
      ),
    );
  }
}

Widget buildTile(IconData icon, String title, String subtitle, context) {
  final deviceH = MediaQuery.of(context).size.height;
  final deviceW = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
    child: Container(
      height: deviceH / 10,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            // textStyle: Theme.of(context).textTheme.display1,
                            fontSize: deviceW / 25,
                            fontWeight: FontWeight.w700,
                            color: AppColors.green),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          // textStyle: Theme.of(context).textTheme.display1,
                          fontSize: deviceW / 30,
                          fontWeight: FontWeight.w400,

                          ///color: AppColors.yellow
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
