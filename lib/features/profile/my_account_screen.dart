import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/repository/data/dummy_data.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    height: 20,
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
                    ResponseData.profileResponseModel!.data!.user!.firstName.toString() +
                        " " +
                        ResponseData.profileResponseModel!.data!.user!.lastName.toString(),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        buildTile(
                            Icons.person,
                            "Name",
                            ResponseData.profileResponseModel!.data!.user!.firstName
                                    .toString() +
                                " " +
                                ResponseData.profileResponseModel!.data!.user!.lastName
                                    .toString(),
                            context),
                        buildTile(
                            Icons.phone,
                            "Phone Number",
                            ResponseData.profileResponseModel!.data!.user!.phoneNumber
                                .toString(),
                            context),
                        buildTile(
                            Icons.email,
                            "Email",
                            ResponseData.profileResponseModel!.data!.user!.email.toString(),
                            context),
                        buildTile(
                            Icons.email,
                            "Location",
                            DummyData.address.toString(),
                            context),
                        buildLogOutTile(Icons.logout, 'Log Out', context)
                      ],
                    ),
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
                    onTap: () {},
                    child: Text(
                      ResponseData.profileResponseModel!.data!.user!.role
                              .toString()[0]
                              .toUpperCase() +
                          ResponseData.profileResponseModel!.data!.user!.role
                              .toString()
                              .substring(1)
                              .toLowerCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )),

          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35),
          //     child: Container(
          //       height: 40,
          //       width: 40,
          //       decoration:
          //           BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          //       child: IconButton(
          //           color: Colors.yellow,
          //           onPressed: () {
          //             //navigatePush(context, EditProfileScreen());
          //             _actionModal(context);
          //           },
          //           icon: const Icon(
          //             CupertinoIcons.pen,
          //             color: AppColors.green,
          //           )),
          //     ),
          //   ),
          // ),
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

  // void _actionModal(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       // backgroundColor: const Color.fromRGBO(54, 183, 255, 0.9),
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(20), topLeft: Radius.circular(20))),
  //       builder: (BuildContext bc) {
  //         return SizedBox(
  //           height: MediaQuery.of(context).size.height * .24,
  //           child: Padding(
  //             padding:
  //                 const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
  //             child: Column(
  //               children: [
  //                 Align(
  //                   alignment: Alignment.topRight,
  //                   child: IconButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: const Icon(
  //                         CupertinoIcons.clear,
  //                         size: 20,
  //                         color: AppColors.red,
  //                       )),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     // Icon(CupertinoIcons.creditcard),
  //                     // Icon(CupertinoIcons.square_list),
  //                     // Icon(CupertinoIcons.archivebox),
  //                     optionSelect(context,
  //                         title: 'Edit Profile',
  //                         iconData: CupertinoIcons.person,
  //                         onTap: () {}),
  //                     // optionSelect(context, title: 'Security', iconData: CupertinoIcons.lock, onTap: (){}),
  //                     optionSelect(context,
  //                         title: 'Security',
  //                         iconData: CupertinoIcons.lock, onTap: () {
  //                       navigatePush(context, const ResetPasswordEmailScreen());
  //                     }),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  optionSelect(BuildContext context,
      {required String title,
      required IconData iconData,
      required VoidCallback onTap}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: PrimaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: PrimaryColor),
                        color: Colors.grey.shade200),
                    height: 60.0,
                    width: 60.0,
                    child: Icon(
                      iconData,
                      color: AppColors.green,
                    ),
                  ),
                ),
                Text(
                  title,

                  // style: AppTextStyleDasP,
                ),
              ],
            ),
          ),
        ),
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
                  width: MediaQuery.of(context).size.width/1.4,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title, maxLines: 4,
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

Widget buildLogOutTile(IconData icon, String title, context) {
  final deviceH = MediaQuery.of(context).size.height;
  final deviceW = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
    child: InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  content: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Lottie.asset("assets/animations/logout_anim.json", )),
                          Text(
                            'Are you sure you want to logout?',
                            style: kSubtitleStyle.copyWith(fontSize: 12),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(

                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('Email');
                          await prefs.remove('Password');
                          await prefs.remove('firstTimeOnApp');
                          await Future.delayed(const Duration(seconds: 2));


                          Navigator.of(context).pushAndRemoveUntil(
                            // the new route
                            MaterialPageRoute(
                              builder: (BuildContext context) => const LoginScreen(),
                            ),
                            (Route route) => false,
                          );
                        },

                        child: Text(
                          "Logout",
                          style: kSubtitleStyle.copyWith(fontSize: 12, color: AppColors.red),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                        style: kSubtitleStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ));
      },
      child: Container(
        height: deviceH / 13,
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
                      color: AppColors.red,
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
                              color: AppColors.red),
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
    ),
  );
}
