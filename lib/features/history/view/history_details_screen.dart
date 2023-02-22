// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' as intl;
//
//
// class HistoryDetailsScreen extends StatefulWidget {
//   const HistoryDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
// }
//
// class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
//
//   bool isLoading = false;
//   bool isLoadingDelete = false;
//   bool isGeneratingCode = false;
//
//   @override
//   void initState() {3
//     super.initState();
//   }
//
//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         navigateBack(context);
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 50,
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(15)),
//                   color: AppColors.grey),
//               padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
//               child: Icon(CupertinoIcons.back, color: Colors.black),
//             ),
//             // Text('Back',
//             //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _submitDeleteRequest() async {
//     FocusScope.of(context).requestFocus(FocusNode());
//
//     setState(() {
//       isLoadingDelete = true;
//     });
//
//     try {
//       await BookingBackend()
//           .deleteBooking(context, widget.bookingHistoryModel.id.toString());
//     } catch (e) {
//       setState(() {
//         isLoadingDelete = false;
//       });
//
//       rethrow;
//     }
//
//     setState(() {
//       isLoadingDelete = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final deviceW = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leadingWidth: 70,
//         leading: _backButton(),
//         actions: [
//           // IconButton(icon: Icons.moreVert, onPressed: null)
//         ],
//         centerTitle: true,
//         title: const Center(
//             child: Text(
//               "Booking Details",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'DMSans',
//                   fontSize: 20.0,
//                   height: 1.5,
//                   fontWeight: FontWeight.bold),
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //roomImages(),
//               ResponseData.loginResponse.serviceProvider == true
//                   ? Container()
//                   : widget.bookingHistoryModel.jobStatus != "Pending"
//                   ? Container()
//                   : Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   isLoadingDelete
//                       ? loaderTwo
//                       : InkWell(
//                     onTap: () => showInfoAlert(
//                       context,
//                       " ",
//                       isDismissible: true,
//                       btnOneText: "Yes, Continue",
//                       btnTwoText: "No, back",
//                       btnOnePressed: () async {
//                         _submitDeleteRequest();
//                       },
//                       btnTwoPressed: () =>
//                           navigateBack(context),
//                       message:
//                       "Are you sure you want to delete this booking?",
//                     ),
//                     child: Container(
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.red.withOpacity(0.1),
//                             border: Border.all(
//                                 color: Colors.grey
//                                     .withOpacity(0.2),
//                                 width: 1),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),
//                             )),
//                         width: deviceW / 4,
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Image(
//                                 image: AssetImage(trash),
//                                 height: 20,
//                               ),
//                               Text(
//                                 "Delete",
//                                 style: TextStyle(
//                                   color: Colors.red
//                                       .withOpacity(0.7),
//                                   fontFamily:
//                                   'DMSans',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // child: ListTile(
//                           //   leading:Image(image: AssetImage(trash), height: 20,),
//                           //   title: Text("Delete", style: TextStyle(
//                           //     color: Colors.red.withOpacity(0.7),
//                           //     fontFamily: 'DMSans',
//                           //     fontWeight: FontWeight.bold,
//                           //
//                           //   ),),
//                           //   // subtitle:Text("See room details",style: TextStyle(
//                           //   //   fontFamily: 'DMSans',
//                           //   // ),),
//                           //
//                           // ),
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               InkWell(
//                 onTap: () => navigatePush(
//                     context,
//                     RoomDetailsScreen(
//                       bookingHistoryModel: widget.bookingHistoryModel,
//                     )),
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: AppColors.color1.withOpacity(0.1),
//                         border: Border.all(
//                             color: Colors.grey.withOpacity(0.2), width: 1),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(10),
//                         )),
//                     width: deviceW,
//                     child: Center(
//                       child: ListTile(
//                         leading: Image(
//                           image: AssetImage(homeIcon),
//                           height: 30,
//                         ),
//                         title: const Text(
//                           "Rooms",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'DMSans',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: const Text(
//                           "See room details",
//                           style: TextStyle(
//                             fontFamily: 'DMSans',
//                           ),
//                         ),
//                         trailing: Icon(
//                           CupertinoIcons.right_chevron,
//                           color: Colors.black,
//                           size: 20,
//                         ),
//                       ),
//                     )),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "Booking No:",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15.0,
//                       height: 1.2,
//                       fontFamily: 'DMSans',
//                     ),
//                   ),
//                   Text(
//                     "#JFURU8${widget.bookingHistoryModel.id}3",
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'DMSans',
//                         fontSize: 20.0,
//                         height: 1.5,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               mainDetails(),
//               const SizedBox(
//                 height: 15,
//               ),
//               isLoading ? loaderOne : _submitButton(),
//               const SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget roomImages() {
//   //   final deviceH = MediaQuery.of(context).size.height;
//   //   final deviceW = MediaQuery.of(context).size.width;
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //     children: [
//   //       Container(
//   //           decoration: BoxDecoration(
//   //               color: AppColors.color1.withOpacity(0.1),
//   //               borderRadius: BorderRadius.all(
//   //                 Radius.circular(10),
//   //               )),
//   //           height: deviceH / 15, // Image radius
//   //           width: deviceW / 7,
//   //           child: ClipRRect(
//   //             borderRadius: BorderRadius.circular(10), // Image border
//   //             child: SizedBox(
//   //               child: Image.network(
//   //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
//   //                 fit: BoxFit.cover,
//   //               ),
//   //             ),
//   //           )
//   //
//   //           //
//   //           // fit: BoxFit.cover, height: 100,),
//   //           ),
//   //       Container(
//   //           decoration: BoxDecoration(
//   //               color: AppColors.color1.withOpacity(0.1),
//   //               borderRadius: BorderRadius.all(
//   //                 Radius.circular(10),
//   //               )),
//   //           height: deviceH / 15, // Image radius
//   //           width: deviceW / 7,
//   //           child: ClipRRect(
//   //             borderRadius: BorderRadius.circular(10), // // Image border
//   //             child: SizedBox(
//   //               child: Image.network(
//   //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
//   //                 fit: BoxFit.cover,
//   //               ),
//   //             ),
//   //           )
//   //
//   //           //
//   //           // fit: BoxFit.cover, height: 100,),
//   //           ),
//   //       Container(
//   //           decoration: BoxDecoration(
//   //               color: AppColors.color1.withOpacity(0.1),
//   //               borderRadius: BorderRadius.all(
//   //                 Radius.circular(10),
//   //               )),
//   //           height: deviceH / 15, // Image radius
//   //           width: deviceW / 7,
//   //           child: ClipRRect(
//   //             borderRadius: BorderRadius.circular(10), // // Image border
//   //             child: SizedBox(
//   //               child: Image.network(
//   //                 "https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmVkcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80",
//   //                 fit: BoxFit.cover,
//   //               ),
//   //             ),
//   //           )
//   //
//   //           //
//   //           // fit: BoxFit.cover, height: 100,),
//   //           ),
//   //       InkWell(
//   //         onTap: () => navigatePush(context, RoomDetailsScreen()),
//   //         child: Container(
//   //             decoration: BoxDecoration(
//   //                 color: AppColors.color1.withOpacity(0.1),
//   //                 border:
//   //                     Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
//   //                 borderRadius: BorderRadius.all(
//   //                   Radius.circular(10),
//   //                 )),
//   //             height: deviceH / 15, // Image radius
//   //             width: deviceW / 2.5,
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //               children: [
//   //                 Image(
//   //                   image: AssetImage(infoCircle),
//   //                   height: 30,
//   //                 ),
//   //                 SizedBox(
//   //                   width: deviceW / 5,
//   //                   child: Text(
//   //                     "See more room  details",
//   //                     maxLines: 2,
//   //                     textDirection: TextDirection.ltr,
//   //                   ),
//   //                 )
//   //               ],
//   //             )
//   //
//   //             //
//   //             // fit: BoxFit.cover, height: 100,),
//   //             ),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   Widget mainDetails() {
//     final deviceH = MediaQuery.of(context).size.height;
//     final deviceW = MediaQuery.of(context).size.width;
//     return Container(
//       height: deviceH / 1.9,
//       decoration: BoxDecoration(
//           color: AppColors.color1.withOpacity(0.1),
//           border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
//           borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(20),
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20))),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             // Row(
//             //   children: [
//             //     Text(
//             //       "Status",
//             //       style: TextStyle(
//             //         color: Colors.black,
//             //         fontSize: deviceW / 35,
//             //         fontFamily: 'DMSans',
//             //         fontWeight: FontWeight.bold,
//             //       ),
//             //     ),
//             //     SizedBox(
//             //       width: 20,
//             //     ),
//             //     Text("Provider requests your Confirmation"),
//             //   ],
//             // ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 4),
//                     child: Chip(
//                       backgroundColor:
//                       widget.bookingHistoryModel.jobStatus == "Pending"
//                           ? Colors.green
//                           : Colors.grey,
//
//                       padding: const EdgeInsets.all(0.0),
//                       // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
//                       label: Text(
//                         "Posted",
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: deviceW / 30,
//                             // fontFamily: 'Avenir',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 4),
//                     child: Chip(
//                       backgroundColor:
//                       widget.bookingHistoryModel.jobStatus == "Accepted"
//                           ? Colors.green
//                           : Colors.grey,
//                       padding: const EdgeInsets.all(0.0),
//                       // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
//                       label: Text(
//                         "Accepted",
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: deviceW / 30,
//                             fontFamily: 'DMSans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 4),
//                     child: Chip(
//                       backgroundColor:
//                       widget.bookingHistoryModel.jobStatus == "Paid"
//                           ? Colors.green
//                           : Colors.grey,
//                       padding: const EdgeInsets.all(5.0),
//                       // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
//                       label: Text(
//                         "Paid",
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: deviceW / 30,
//                             fontFamily: 'DMSans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 4),
//                     child: Chip(
//                       backgroundColor:
//                       widget.bookingHistoryModel.jobStatus == "In Progress"
//                           ? Colors.green
//                           : Colors.grey,
//                       padding: const EdgeInsets.all(0.0),
//                       // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
//                       label: Text(
//                         "In Progress",
//                         textAlign: TextAlign.center,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: deviceW / 30,
//                             // fontFamily: 'Avenir',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Chip(
//                     backgroundColor:
//                     widget.bookingHistoryModel.jobStatus == "Done"
//                         ? Colors.green
//                         : Colors.grey,
//                     padding: const EdgeInsets.all(0.0),
//                     // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
//                     label: Text(
//                       "Job Done",
//                       textAlign: TextAlign.center,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: deviceW / 30,
//                           fontFamily: 'DMSans',
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             widget.bookingHistoryModel.jobStatus != "Pending"
//                 ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   " ${ResponseData.loginResponse.serviceProvider == true ? "Customer" : "Provider"} Details",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey.withOpacity(0.1),
//                         border: Border.all(
//                             color: Colors.grey.withOpacity(0.1),
//                             width: 1),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(15),
//                         )),
//                     height: 60, // Image radius
//                     width: deviceW,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Image(image: AssetImage(userIcon),height: 40, ),
//                         // SizedBox(width: deviceW,
//                         //   child: Text("See more room  details", maxLines: 2, textDirection: TextDirection.ltr,)
//                         //   ,)
//
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Image.asset(
//                             userIcon,
//                             height: 25,
//                           ),
//                         ),
//
//                         // SizedBox(width: deviceW/30,),
//                         Container(
//                           width: deviceW * 3.2 / 6.5,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Name",
//                                 maxLines: 2,
//                                 textDirection: TextDirection.ltr,
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontFamily: 'DMSans',
//                                     fontSize: 20.0,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.bold)
//                                     .copyWith(fontSize: 17),
//                               ),
//                               Text(
//                                 ResponseData.loginResponse
//                                     .serviceProvider ==
//                                     true
//                                     ? widget.bookingHistoryModel.user
//                                     .firstName +
//                                     " " +
//                                     widget.bookingHistoryModel.user
//                                         .lastName
//                                     : widget.bookingHistoryModel.provider
//                                     .firstName +
//                                     " " +
//                                     widget.bookingHistoryModel
//                                         .provider.lastName,
//                                 maxLines: 2,
//                                 textDirection: TextDirection.ltr,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15.0,
//                                   height: 1.2,
//                                   fontFamily: 'DMSans',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => navigatePush(
//                               context,
//                               ProviderOnBookingDetails(
//                                   ResponseData.loginResponse.serviceProvider ==
//                                       true
//                                       ? widget.bookingHistoryModel.user
//                                       : widget.bookingHistoryModel.provider)),
//                           child: Container(
//                             width: deviceW * 1.3 / 6.5,
//                             height: 60,
//                             decoration: const BoxDecoration(
//                                 color: Colors.black12,
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(15))),
//                             child: SizedBox(
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "View",
//                                           style: TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: deviceW / 30,
//                                             fontFamily:
//                                             'DMSans',
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Icon(
//                                           CupertinoIcons.right_chevron,
//                                           color: Colors.black,
//                                           size: 20,
//                                         ),
//                                       ],
//                                     ))),
//                           ),
//                         ),
//                       ],
//                     )
//
//                   //
//                   // fit: BoxFit.cover, height: 100,),
//                 ),
//               ],
//             )
//                 : Container(),
//             // ? Container()
//             // : ResponseData.loginResponse.serviceProvider == true
//             //     ? Container()
//             //     : ,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Working Time",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   intl.DateFormat.yMMMMEEEEd()
//                       .format(intl.DateFormat("yyyy-MM-dd")
//                       .parse(widget.bookingHistoryModel.startDate))
//                       .toString(),
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//                 Text(
//                   intl.DateFormat.jm()
//                       .format(intl.DateFormat("hh:mm")
//                       .parse(widget.bookingHistoryModel.startTime))
//                       .toString(),
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Location",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   widget.bookingHistoryModel.place.landMark +
//                       ", " +
//                       widget.bookingHistoryModel.place.address,
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "State",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   widget.bookingHistoryModel.place.state,
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Job Description",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   widget.bookingHistoryModel.description,
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Working Hours",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   intl.DateFormat.jm()
//                       .format(intl.DateFormat("hh:mm")
//                       .parse(widget.bookingHistoryModel.startTime))
//                       .toString(),
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Cost",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: deviceW / 35,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "₦ ${widget.bookingHistoryModel.amount}",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: deviceW / 35,
//                     // fontFamily: 'DMSans',
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> userSubmitRequest(status) async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       await UpdateBookingBackend()
//           .userUpdateStatus(context, status, widget.bookingHistoryModel.id);
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//
//       rethrow;
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   Future<void> providerSubmitRequest(status) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       await UpdateBookingBackend()
//           .providedUpdateStatus(context, status, widget.bookingHistoryModel.id);
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//
//       rethrow;
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   _submitButton() {
//     if (ResponseData.loginResponse.serviceProvider == true) {
//       if (StringUtils.equalsIgnoreCase(
//           'Pending', widget.bookingHistoryModel.jobStatus.toString())) {
//         return AppLargeButton(
//           text: "Accept Job",
//           onTap: () => providerSubmitRequest("accepted"),
//         );
//       } else if (StringUtils.equalsIgnoreCase(
//           'Accepted', widget.bookingHistoryModel.jobStatus.toString())) {
//         return Container();
//       } else if (StringUtils.equalsIgnoreCase(
//           'paid', widget.bookingHistoryModel.jobStatus.toString())) {
//         return AppLargeButton(
//           text: "Start Job",
//           onTap: () => providerSubmitRequest("in_progress"),
//         );
//       } else if (StringUtils.equalsIgnoreCase(
//           'In Progress', widget.bookingHistoryModel.jobStatus.toString())) {
//         return Container();
//       } else {
//         return Container();
//       }
//     } else {
//       if (StringUtils.equalsIgnoreCase(
//           'Pending', widget.bookingHistoryModel.jobStatus.toString())) {
//         return Container();
//       } else if (StringUtils.equalsIgnoreCase(
//           'Accepted', widget.bookingHistoryModel.jobStatus.toString())) {
//         return AppLargeButton(
//           text: "Make Payment",
//           onTap: () => chargeCard(),
//         );
//       } else if (StringUtils.equalsIgnoreCase(
//           'paid', widget.bookingHistoryModel.jobStatus.toString())) {
//         return Container();
//       } else if (StringUtils.equalsIgnoreCase(
//           'In Progress', widget.bookingHistoryModel.jobStatus.toString())) {
//         return AppLargeButton(
//           text: "Confirm Job Completed",
//           onTap: () => userSubmitRequest("done"),
//         );
//       } else {
//         return Container();
//       }
//     }
//   }
//
//   chargeCard() async {
//     //double payStackCharge = double.parse(widget.subtotal.toString()) * 0.015;
//     //int amount = int.parse(widget.bookingHistoryModel.amount.toString()) ;
//     int amount = widget.bookingHistoryModel.amount.toInt();
//     // int finalAmount = deliveryFee + amount;
//     Charge charge = Charge()
//       ..amount = amount * 100
//       ..reference = reference
//     // or ..accessCode = _getAccessCodeFrmInitialization()
//       ..email = DummyData.emailAddress.toString().trim();
//     CheckoutResponse response = await plugin.checkout(
//       context,
//       method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
//       charge: charge,
//     );
//     if (response.status == true) {
//       logger.wtf(response);
//       await _verifyOnServer(response.reference);
//     } else {
//       showErrorAlert(context,
//           message: 'Error in processing payment, please try again');
//       //calculateDistance();
//     }
//   }
//
//   // chargeBank() async {
//   //   setState(() {
//   //     isGeneratingCode = !isGeneratingCode;
//   //   });
//   //
//   //   Map accessCode = await createAccessCode(int.parse(widget.bookingHistoryModel.amount.toString()+"00"));
//   //
//   //   setState(() {
//   //     isGeneratingCode = !isGeneratingCode;
//   //   });
//   //
//   //   int amount = int.parse(widget.bookingHistoryModel.amount.toString()) ;
//   //   Charge charge = Charge()
//   //     ..amount = amount * 100
//   //     ..reference = _getReference()
//   //     ..accessCode = accessCode["data"]["access_code"]
//   //     ..email = DummyData.emailAddress.toString().trim();
//   //   CheckoutResponse response = await plugin.checkout(
//   //     context,
//   //     method: CheckoutMethod.bank, // Defaults to CheckoutMethod.selectable
//   //     charge: charge,
//   //   );
//   //   if (response.status == true) {
//   //     //  _showDialog();
//   //     print(response);
//   //     //var amount = double.parse(widget.amount);
//   //     // await;
//   //   } else {
//   //     showErrorAlert(context, message: 'Error in processing payment, please try again');
//   //
//   //   }
//   // }
//
//   Future<void> _verifyOnServer(String reference) async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await verifyPayment(context,
//           bookingId: widget.bookingHistoryModel.id, reference: reference);
//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//
//       print(e);
//     }
//   }
//
//   Future<void> verifyPayment(BuildContext context,
//       {String reference, int bookingId}) async {
//     final url = http + baseURL + api + version + verifyPaymentPath;
//
//     logger.i(url);
//     logger.i(json.encode({"bookingId": bookingId, "transRef": reference}));
//
//     try {
//       final httpConnectionApi = await Client.post(
//         Uri.parse(url),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//           HttpHeaders.authorizationHeader:
//           'Bearer ${ResponseData.jwtVerifyAuth.token}',
//         },
//         body: json.encode({"bookingId": bookingId, "transRef": reference}),
//       ).timeout(const Duration(seconds: 60));
//
//       logger.v(httpConnectionApi.body);
//       logger.v(httpConnectionApi.statusCode);
//
//       if (httpConnectionApi.statusCode == 200) {
//         var resBody = jsonDecode(httpConnectionApi.body.toString());
//         ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
//         if (ResponseData.defaultResponse.responseCode == "00") {
//           logger.wtf(ResponseData.defaultResponse.data);
//           userSubmitRequest("paid");
//
//           logger.wtf(
//               "Service Provider?: ${ResponseData.loginResponse.serviceProvider}");
//         }
//       } else {
//         showErrorAlert(context, message: somethingWentWrongText);
//       }
//     } on Exception catch (e) {
//       showErrorAlert(context, message: somethingWentWrongText);
//
//       print(e);
//       rethrow;
//     }
//   }
// }