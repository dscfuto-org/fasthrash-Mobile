import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/repository/backend/alerts_backend.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/utils/alerts.dart';
import 'package:fastrash/utils/buttons.dart';
import 'package:fastrash/utils/loaders.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;


class HistoryDetailsScreen extends StatefulWidget {
  final depositHistoryModel;
  final String collectorType;

  const HistoryDetailsScreen({super.key, required this.depositHistoryModel, required this.collectorType});


  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {

  bool isLoading = false;
  bool isLoadingDelete = false;
  bool isGeneratingCode = false;
 
  @override
  void initState() {
    super.initState();
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        navigateBack(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),),
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(CupertinoIcons.back, color: Colors.black),
            ),
            // Text('Back',
            //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Future<void> _submitDeleteRequest() async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      isLoadingDelete = true;
    });

    try {
      displayLongToastMessage("Please wait...");
      if(ResponseData.profileResponseModel!.data!.user!.role.toString() == "user"){
        await AlertsBackend().deleteUTCAlert(context, widget.depositHistoryModel.id.toString());
      } else {
        displayLongToastMessage("Please wait...");
        await AlertsBackend().deleteCTOAlert(context, widget.depositHistoryModel.id.toString());
      }

    } catch (e) {
      setState(() {
        isLoadingDelete = false;
      });

      rethrow;
    }

    setState(() {
      isLoadingDelete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;
   /// String phoneNo =  

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70,
        leading: _backButton(),
        actions: const [
          // IconButton(icon: Icons.moreVert, onPressed: null)
        ],
        centerTitle: true,
        title: const Text(
          "Alert Details",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'DMSans',
              fontSize: 20.0,
              height: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
      body:  Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // ResponseData.profileResponseModel!.data!.user!.role != "user"
                  //     ? Container()
                  //     :
                  widget.depositHistoryModel.status != "pending"
                      ? Container()
                      : isLoadingDelete
                      ? Container()
                      :Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       InkWell(
                        onTap: () => showInfoAlert(
                          context,
                          " ",
                          isDismissible: true,
                          btnOneText: "Continue",
                          btnTwoText: "No, back",
                          btnOnePressed: () async {
                            navigateBack(context);
                            _submitDeleteRequest();
                          },
                          btnTwoPressed: () =>
                              navigateBack(context),
                          message:
                          "Are you sure you want to delete this alert?",
                        ),
                        child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.grey
                                        .withOpacity(0.2),
                                    width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            width: deviceW / 4,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(CupertinoIcons.trash, color: Colors.red,),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.red
                                          .withOpacity(0.7),
                                      fontFamily:
                                      'DMSans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // child: ListTile(
                              //   leading:Image(image: AssetImage(trash), height: 20,),
                              //   title: Text("Delete", style: TextStyle(
                              //     color: Colors.red.withOpacity(0.7),
                              //     fontFamily: 'DMSans',
                              //     fontWeight: FontWeight.bold,
                              //
                              //   ),),
                              //   // subtitle:Text("See room details",style: TextStyle(
                              //   //   fontFamily: 'DMSans',
                              //   // ),),
                              //
                              // ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: deviceW/1.1,
                    height: deviceH/4,
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),  color: Colors.grey,),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(widget.depositHistoryModel.images![0].toString(),)),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => navigatePush(
                  //       context,
                  //       RoomDetailsScreen(
                  //         bookingHistoryModel: widget.bookingHistoryModel,
                  //       )),
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //           color: AppColors.color1.withOpacity(0.1),
                  //           border: Border.all(
                  //               color: Colors.grey.withOpacity(0.2), width: 1),
                  //           borderRadius: const BorderRadius.all(
                  //             Radius.circular(10),
                  //           )),
                  //       width: deviceW,
                  //       child: Center(
                  //         child: ListTile(
                  //           leading: Image(
                  //             image: AssetImage(homeIcon),
                  //             height: 30,
                  //           ),
                  //           title: const Text(
                  //             "Rooms",
                  //             style: TextStyle(
                  //               color: Colors.black,
                  //               fontFamily: 'DMSans',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           subtitle: const Text(
                  //             "See room details",
                  //             style: TextStyle(
                  //               fontFamily: 'DMSans',
                  //             ),
                  //           ),
                  //           trailing: const Icon(
                  //             CupertinoIcons.right_chevron,
                  //             color: Colors.black,
                  //             size: 20,
                  //           ),
                  //         ),
                  //       )),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Alert ID: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          height: 1.2,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        "#${widget.depositHistoryModel.id!.toUpperCase()}3",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'DMSans',
                            fontSize: 20.0,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  mainDetails(),
                  const SizedBox(
                    height: 15,
                  ),
                  isLoading ? loaderOne : _submitButton(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Padding(padding:  const EdgeInsets.all(20.0),
            child: isLoadingDelete ?  Container(
              color: Colors.white.withOpacity(0.7),
              child: const Center(
                  child: loaderOne
              ),
            ) : Container(),
            )
        ],
      ),
    );
  }

  // Widget roomImages() {
  //   final deviceH = MediaQuery.of(context).size.height;
  //   final deviceW = MediaQuery.of(context).size.width;
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //           decoration: BoxDecoration(
  //               color: AppColors.color1.withOpacity(0.1),
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10),
  //               )),
  //           height: deviceH / 15, // Image radius
  //           width: deviceW / 7,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10), // Image border
  //             child: SizedBox(
  //               child: Image.network(
  //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           )
  //
  //           //
  //           // fit: BoxFit.cover, height: 100,),
  //           ),
  //       Container(
  //           decoration: BoxDecoration(
  //               color: AppColors.color1.withOpacity(0.1),
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10),
  //               )),
  //           height: deviceH / 15, // Image radius
  //           width: deviceW / 7,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10), // // Image border
  //             child: SizedBox(
  //               child: Image.network(
  //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           )
  //
  //           //
  //           // fit: BoxFit.cover, height: 100,),
  //           ),
  //       Container(
  //           decoration: BoxDecoration(
  //               color: AppColors.color1.withOpacity(0.1),
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10),
  //               )),
  //           height: deviceH / 15, // Image radius
  //           width: deviceW / 7,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10), // // Image border
  //             child: SizedBox(
  //               child: Image.network(
  //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           )
  //
  //           //
  //           // fit: BoxFit.cover, height: 100,),
  //           ),
  //       InkWell(
  //         onTap: () => navigatePush(context, RoomDetailsScreen()),
  //         child: Container(
  //             decoration: BoxDecoration(
  //                 color: AppColors.color1.withOpacity(0.1),
  //                 border:
  //                     Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
  //                 borderRadius: BorderRadius.all(
  //                   Radius.circular(10),
  //                 )),
  //             height: deviceH / 15, // Image radius
  //             width: deviceW / 2.5,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Image(
  //                   image: AssetImage(infoCircle),
  //                   height: 30,
  //                 ),
  //                 SizedBox(
  //                   width: deviceW / 5,
  //                   child: Text(
  //                     "See more room  details",
  //                     maxLines: 2,
  //                     textDirection: TextDirection.ltr,
  //                   ),
  //                 )
  //               ],
  //             )
  //
  //             //
  //             // fit: BoxFit.cover, height: 100,),
  //             ),
  //       ),
  //     ],
  //   );
  // }

  Widget mainDetails() {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Container(
      height: deviceH / 2.2,
      decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.1),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Row(
            //   children: [
            //     Text(
            //       "Status",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: deviceW / 35,
            //         fontFamily: 'DMSans',
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 20,
            //     ),
            //     Text("Provider requests your Confirmation"),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //
            //     Padding(
            //       padding: const EdgeInsets.only(right: 4),
            //       child: Chip(
            //         backgroundColor:
            //         widget.depositHistoryModel.status == "accepted"
            //             ? AppColors.yellow
            //             : Colors.grey,
            //         padding: const EdgeInsets.all(0.0),
            //         // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //         label: Text(
            //           "Accepted",
            //           textAlign: TextAlign.center,
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis,
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: deviceW / 30,
            //               fontFamily: 'DMSans',
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //
            //     Chip(
            //       backgroundColor:
            //       widget.depositHistoryModel.status == "collected"
            //           ? AppColors.green : Colors.grey,
            //       padding: const EdgeInsets.all(0.0),
            //       // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //       label: Text(
            //         "Collected",
            //         textAlign: TextAlign.center,
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: deviceW / 30,
            //             fontFamily: 'DMSans',
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Chip(
                    backgroundColor: getColour(),
                    padding: const EdgeInsets.all(0.0),
                    // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
                    label: Text(
                      /// toBeginningOfSentenceCase(widget.depositHistoryModel.status.toString()),
                      StringUtils.capitalize(widget.depositHistoryModel.status.toString()),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceW / 30,
                          // fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            widget.depositHistoryModel.status != "pending"
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${ResponseData.profileResponseModel!.data!.user!.role == "collector" ? "User" : "Collector"} Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                            width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        )),
                    height: 60, // Image radius
                    width: deviceW,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image(image: AssetImage(userIcon),height: 40, ),
                        // SizedBox(width: deviceW,
                        //   child: Text("See more room  details", maxLines: 2, textDirection: TextDirection.ltr,)
                        //   ,)

                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.account_circle)
                        ),

                        SizedBox(width: deviceW/30,),
                        SizedBox(
                          width: deviceW *4.7/10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name",
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'DMSans',
                                    fontSize: 20.0,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold)
                                    .copyWith(fontSize: 17),
                              ),
                              Text(
                                ResponseData.profileResponseModel!.data!.user!.role == "collector" ? widget.depositHistoryModel.userName.toString() : widget.depositHistoryModel.collectorName.toString(),
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  height: 1.2,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                       SizedBox(
                         width: deviceW *2.5 /10,
                         child:  Row(
                           children: [
                             buildItemUrl(  FontAwesomeIcons.whatsapp, onTap:()=> launchInURL(Uri.parse(whatsappUrl()))),
                             buildItemUrl( CupertinoIcons.phone,onTap:()=> launchInURL(
                                 Uri.parse("tel:${ResponseData.profileResponseModel!.data!.user!.role == "collector" ?
                                 widget.depositHistoryModel.userPhone.toString() : widget.depositHistoryModel.collectorPhone.toString()}"))),
                             buildItemUrl( CupertinoIcons.mail,onTap:()=> launchInURL
                               (Uri.parse('sms:${ResponseData.profileResponseModel!.data!.user!.role == "collector" ?
                             widget.depositHistoryModel.userPhone.toString() : widget.depositHistoryModel.collectorPhone.toString()}?body=Hello, I am contacting you from Fastrash App'))),
                           ],
                         ),
                       )
                      ],
                    )

                  //
                  // fit: BoxFit.cover, height: 100,),
                ),
              ],
            )
                : Container(),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.depositHistoryModel.address.toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.depositHistoryModel.description.toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date Posted",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    intl.DateFormat("E, d MMM yyyy HH:mm a").format(
                      DateTime.parse(widget.depositHistoryModel.createdAt.toString()),
                    ).toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceW / 35,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.depositHistoryModel.quantity} kg",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: deviceW / 35,
                    // fontFamily: 'DMSans',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> userSubmitRequest(status) async {
    setState(() {
      isLoading = true;
    });
    try {
      ///await AlertsBackend().updateUTCAlert(context, status: status, alertId: widget.depositHistoryModel.id.toString());
      ///
      await AlertsBackend().updateUTCAlertToCollected(context, alertId: widget.depositHistoryModel.id.toString(),
          status: status, userId:  widget.depositHistoryModel.userId!.toString());
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      rethrow;
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> providerSubmitRequest(status) async {
    setState(() {
      isLoading = true;
    });

    try {
     /// await AlertsBackend().updateUTCAlert(context, status: status, alertId:  widget.depositHistoryModel.id.toString());
      ///
      await AlertsBackend().updateCTOAlertToCollected(context, alertId: widget.depositHistoryModel.id.toString(),
          status: status, collectorId:  widget.depositHistoryModel.userId!.toString());
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      rethrow;
    }
    setState(() {
      isLoading = false;
    });
  }

  _submitButton() {
    if (ResponseData.profileResponseModel!.data!.user!.role == "collector") {
     /// return Container();

      if(widget.collectorType == "Deposit"){
        if (StringUtils.equalsIgnoreCase(
            'pending', widget.depositHistoryModel.status.toString())) {
          return Container();
        } else if (StringUtils.equalsIgnoreCase(
            'Accepted', widget.depositHistoryModel.status.toString())) {
          return AppLargeButton(
            text: "Mark as Collected",
            onTap:  ()=> showInfoAlert(
              context,
              " ",
              isDismissible: true,
              btnOneText: "Continue",
              btnTwoText: "No, back",
              btnOnePressed: () async {
                navigateBack(context);
                providerSubmitRequest("collected");
              },
              btnTwoPressed: () =>
                  navigateBack(context),
              message:
              "Marking ths alert as completed means it as been collected",
            ),
          );
        } else if ( StringUtils.equalsIgnoreCase(
            'collected', widget.depositHistoryModel.status.toString())) {
          return Container();
        } else {
          return Container();
        }
      } else {
        return Container();
      }


    }
    /// ########

    else {
      if (StringUtils.equalsIgnoreCase(
          'pending', widget.depositHistoryModel.status.toString())) {
        return Container();
      } else if (StringUtils.equalsIgnoreCase(
          'Accepted', widget.depositHistoryModel.status.toString())) {
        return AppLargeButton(
          text: "Mark as Collected",
          onTap: ()=> showInfoAlert(
            context,
            " ",
            isDismissible: true,
            btnOneText: "Continue",
            btnTwoText: "No, back",
            btnOnePressed: () async {
              navigateBack(context);
              userSubmitRequest("collected");
            },
            btnTwoPressed: () => navigateBack(context),
            message:
            "Marking ths alert as completed means it as been collected",
          ),
        );
      } else if ( StringUtils.equalsIgnoreCase(
          'collected', widget.depositHistoryModel.status.toString())) {
        return Container();
      } else {
        return Container();
      }
    }
  }


  getColour() {
    if(widget.depositHistoryModel.status == "pending"){
      return AppColors.red;
    }  else if (widget.depositHistoryModel.status == "accepted"){
      return AppColors.yellow;
    } else {
      return AppColors.green;
    }
  }

  Widget buildItemUrl( IconData icon, {required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Icon(
          icon,
          ///color: AppColors.dark,
        ),
      ),
    );
  }


  String whatsappUrl() {
    if (Platform.isAndroid) {
      return "https://wa.me/${ResponseData.profileResponseModel!.data!.user!.role == "collector" ? widget.depositHistoryModel.userPhone.toString() : widget.depositHistoryModel.collectorPhone.toString()}/?text=${Uri.encodeFull("Hello, I am contacting you from Fastrash App")}";
      // return "https://wa.me/phone:+234${widget.bookingHistoryModel.phoneNumber.toString()}:/?text=${Uri.parse("")}";
    } else {
      print("https://wa.me/${ResponseData.profileResponseModel!.data!.user!.role == "collector" ? widget.depositHistoryModel.userPhone.toString() : widget.depositHistoryModel.collectorPhone.toString()}/?text=${Uri.encodeFull("Hello, I am contacting you from Fastrash App")}");
      return "https://wa.me/${ResponseData.profileResponseModel!.data!.user!.role == "collector" ? widget.depositHistoryModel.userPhone.toString() : widget.depositHistoryModel.collectorPhone.toString()}/?text=${Uri.encodeFull("Hello, I am contacting you from Fastrash App")}";
    }
  }




}