
import 'package:fastrash/auth/login_screen.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

showInfoAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  btnOnePressed,
  btnOneText,
  btnTwoText,
  btnTwoPressed,
}) {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  bool isLoading = false;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
              child: AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                content: SizedBox(
                  height: deviceH / 3.5,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      SizedBox(
                          height: deviceH / 14,
                          child: Icon(
                            Icons.info,
                            color: Colors.red,
                            size: 50.sp,
                          )),

                      // Text(title, textAlign: TextAlign.center, style: kTitleStyle,),
                      Container(
                        height: deviceH / 9,
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'DMSans',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: deviceH / 11,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: btnTwoPressed,
                              child: Text(
                                btnTwoText.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                            isLoading
                                ? loaderTwo
                                : MaterialButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      try {
                                        await btnOnePressed();
                                        // navigateBack(context);

                                      } catch (e) {
                                        setState(() {
                                          isLoading = false;
                                        });

                                        rethrow;
                                      }

                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: Container(
                                      width: width / 4,
                                      height: 50.w,
                                      padding: EdgeInsets.all(5.r),
                                      // alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)),
                                        color: AppColors.green,
                                      ),
                                      child: Center(
                                        child: Text(

                                          btnOneText.toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}


showTrashInfoAlert(
    BuildContext context,
    String title, {
      required String message,
      required String date,
      required String name,
      required String image,
      required bool isDismissible,
      btnOnePressed,
      btnOneText,
      btnTwoText,
      btnTwoPressed,
    }) {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  bool isLoading = false;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
              child: AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                content: SizedBox(
                  height: deviceH / 3.5,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          SizedBox(
                              height: deviceH / 14,
                              width: width *1.5 /10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.network(image.toString(),)),
                              ),),

                          SizedBox(
                              width: width *6/10,
                              child: Text(title, textAlign: TextAlign.left, style: kTitleStyle.copyWith(fontSize: 13.sp),)),

                        ],),
                      ),
                     Container(
                        height: deviceH / 11,
                        //color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name",
                                  /// textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,fontWeight: FontWeight.bold,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                                Text(
                                  name,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                            ],),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date",
                                  /// textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,fontWeight: FontWeight.bold,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                                Text(
                                  date,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                              ],),

                            Text(
                              "Description",
                              /// textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,fontWeight: FontWeight.bold,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            Text(
                              message,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'DMSans',
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        height: deviceH / 11,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: btnTwoPressed,
                              child: Text(
                                btnTwoText.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                            isLoading
                                ? loaderTwo
                                : MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  await btnOnePressed();
                                  // navigateBack(context);

                                } catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });

                                  rethrow;
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Container(
                                width: width / 4,
                                height: 50.w,
                                padding: EdgeInsets.all(5.r),
                                // alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.r)),
                                  color: AppColors.green,
                                ),
                                child: Center(
                                  child: Text(

                                    btnOneText.toString(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}



Future<void> showSuccessAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  btnOnePressed,
  btnOneText,
}) async {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: deviceH / 3.0,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: deviceH / 8,
                    child:
                        Lottie.asset("assets/animations/success_lottie.json"),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      height: 1.2,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      navigateBack(context);
                      btnOnePressed();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      // alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColors.green),
                      child: Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(height: 20,),
                  // MaterialButton(
                  //   onPressed: btnTwoPressed,
                  //   child: Container(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width * 0.4,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.2),
                  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         btnTwoText.toString(),
                  //         style: TextStyle(
                  //             color: Colors.red,
                  //             fontSize: 16.0,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> showRegisterAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  btnOnePressed,
  btnOneText,
}) async {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: deviceH / 3.0,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: deviceH / 8,
                    child:
                        Lottie.asset("assets/animations/success_lottie.json"),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      height: 1.2,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await navigatePush(context, const LoginScreen());
                      btnOnePressed();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      // alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColors.green),
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(height: 20,),
                  // MaterialButton(
                  //   onPressed: btnTwoPressed,
                  //   child: Container(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width * 0.4,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.2),
                  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         btnTwoText.toString(),
                  //         style: TextStyle(
                  //             color: Colors.red,
                  //             fontSize: 16.0,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> showCreateAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  btnOnePressed,
  btnOneText,
}) async {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: deviceH / 3.0,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: deviceH / 8,
                    child:
                        Lottie.asset("assets/animations/success_lottie.json"),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      height: 1.2,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await navigateBack(context);
                      btnOnePressed();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      // alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColors.green),
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(height: 20,),
                  // MaterialButton(
                  //   onPressed: btnTwoPressed,
                  //   child: Container(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width * 0.4,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.2),
                  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         btnTwoText.toString(),
                  //         style: TextStyle(
                  //             color: Colors.red,
                  //             fontSize: 16.0,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> showFailureAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  btnOnePressed,
  btnOneText,
}) async {
  final width = MediaQuery.of(context).size.width;
  final deviceH = MediaQuery.of(context).size.height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: deviceH / 3,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: deviceH / 8,
                    child: Lottie.asset("assets/animations/error.json"),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        height: 1.2,
                        fontFamily: 'DMSans',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await navigateBack(context);
                      btnOnePressed();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      // alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppColors.green),
                      child: Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "DMSans",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(height: 20,),
                  // MaterialButton(
                  //   onPressed: btnTwoPressed,
                  //   child: Container(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width * 0.4,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.2),
                  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         btnTwoText.toString(),
                  //         style: TextStyle(
                  //             color: Colors.red,
                  //             fontSize: 16.0,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> showAlertDialogThenNavigateReplace(BuildContext context,
    String message, bool isDismissible, Widget widget) async {
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Notification'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  navigateReplace(context, widget);
                },
              )
            ],
          ),
        );
      });
}

displayShortToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
}

displayLongToastMessage(String message) {
  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
}


onSubmitButton(
    {required Color buttonColor,
    required Color textColor,
    required String text,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.h,
      width: 127.w,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: kTitleStyle.copyWith(
                  color: textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 14.w,
            ),
            Icon(
              icon,
              color: iconColor,
              size: 20.r,
            ),
          ],
        ),
      ),
    ),
  );
}
