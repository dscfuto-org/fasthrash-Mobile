
import 'package:fastrash/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> onBackPressed(BuildContext context) async {
  var deviceH = MediaQuery.of(context).size.height;
  var deviceW = MediaQuery.of(context).size.width;

  // Show an alert dialog to confirm or cancel the navigation
  bool confirmNavigation = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              title: Center(
                child: Text('Are you sure?', style: TextStyle(
                  fontSize: deviceW/18,
                  fontWeight: FontWeight.w200,
                  color: AppColors.green,
                ),),
              ),
              content: SizedBox(
                  height: 115,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Do you want to exit this App', style: TextStyle(
                        fontSize: deviceW/25,
                        fontWeight: FontWeight.w200,
                        // color: Colors.b,
                      ),),
                      SizedBox(height: deviceH/50,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(false),
                              child: Container( width: deviceW/5,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    //  border: Border.all(color: Colors.white, width: 2),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: const Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [AppColors.green, AppColors.green])
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                    child: Text('No',
                                      style:TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => SystemNavigator.pop(),
                              child: Container( width: deviceW/5,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    //  border: Border.all(color: Colors.white, width: 2),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: const Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [AppColors.green, AppColors.green])
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                  child: Center(
                                    child: Text('Yes',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),

            );
    },
  );

  // If the user confirms the navigation, pop the route
  return confirmNavigation;

  // bool confirmNavigation = await  showDialog(
  //   context: context,
  //   builder: (context) => AlertDialog(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10)
  //     ),
  //     title: Center(
  //       child: Text('Are you sure?', style: TextStyle(
  //         fontSize: deviceW/18,
  //         fontWeight: FontWeight.w200,
  //         color: AppColors.green,
  //       ),),
  //     ),
  //     content: SizedBox(
  //         height: 115,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Text('Do you want to exit this App', style: TextStyle(
  //               fontSize: deviceW/25,
  //               fontWeight: FontWeight.w200,
  //               // color: Colors.b,
  //             ),),
  //             SizedBox(height: deviceH/50,),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: InkWell(
  //                     onTap: () => Navigator.of(context).pop(false),
  //                     child: Container( width: deviceW/5,
  //                       decoration: BoxDecoration(
  //                           borderRadius: const BorderRadius.all(Radius.circular(15)),
  //                           //  border: Border.all(color: Colors.white, width: 2),
  //                           boxShadow: <BoxShadow>[
  //                             BoxShadow(
  //                                 color: Colors.grey.shade200,
  //                                 offset: const Offset(2, 4),
  //                                 blurRadius: 5,
  //                                 spreadRadius: 2)
  //                           ],
  //                           gradient: const LinearGradient(
  //                               begin: Alignment.centerLeft,
  //                               end: Alignment.centerRight,
  //                               colors: [AppColors.green, AppColors.green])
  //                       ),
  //                       child: const Center(
  //                         child: Padding(
  //                           padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
  //                           child: Text('No',
  //                             style:TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w200,
  //                               color: Colors.white,
  //                             ),),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: InkWell(
  //                     onTap: () => SystemNavigator.pop(),
  //                     child: Container( width: deviceW/5,
  //                       decoration: BoxDecoration(
  //                           borderRadius: const BorderRadius.all(Radius.circular(15)),
  //                           //  border: Border.all(color: Colors.white, width: 2),
  //                           boxShadow: <BoxShadow>[
  //                             BoxShadow(
  //                                 color: Colors.grey.shade200,
  //                                 offset: const Offset(2, 4),
  //                                 blurRadius: 5,
  //                                 spreadRadius: 2)
  //                           ],
  //                           gradient: const LinearGradient(
  //                               begin: Alignment.centerLeft,
  //                               end: Alignment.centerRight,
  //                               colors: [AppColors.green, AppColors.green])
  //                       ),
  //                       child: const Padding(
  //                         padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
  //                         child: Center(
  //                           child: Text('Yes',
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w200,
  //                               color: Colors.white,
  //                             ),),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         )
  //     ),
  //
  //   ),
  // ) ;
}