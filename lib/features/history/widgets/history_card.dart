import 'package:badges/badges.dart' as badge;
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/features/history/view/history_details_screen.dart';
import 'package:fastrash/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class HistoryCard extends StatelessWidget {

  final depositHistoryModel;
  final String collectorType;

  const HistoryCard({super.key, required this.depositHistoryModel, required this.collectorType});




  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => navigatePush(context, HistoryDetailsScreen(
          depositHistoryModel: depositHistoryModel, collectorType: collectorType,)),
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.2),
                //border: Border.all(color: AppColors.green.withOpacity(0.2), width: 2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            width: width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width/6.5,
                    height: width / 6.5,
                    decoration: const BoxDecoration(
                       // color: AppColors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(depositHistoryModel.images![0].toString(),)),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: width * 0.15 / 6.5,
                  // ),
                  SizedBox(
                    width: width/2.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          // StringUtils.capitalize(
                          //     "${widget.jobsHistory.jobTitle} "),
                              depositHistoryModel.description.toString(),
                          maxLines: 2, overflow: TextOverflow.ellipsis,

                          /// textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'DMSans',
                              fontSize: 14.sp,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   // widget.jobsHistory.place.address +
                        //   //     ", " +
                        //   //     widget.jobsHistory.place.state,
                        //   "${depositHistoryModel.quantity} kg",
                        //   maxLines: 1, overflow: TextOverflow.ellipsis,
                        //
                        //   /// textDirection: TextDirection.UNKNOWN,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 15.0,
                        //     height: 1.2,
                        //     fontFamily: 'DMSans',
                        //   ),
                        // ),
                        badge.Badge(
                          elevation: 0,
                          badgeColor: getColour(),
                          toAnimate: false,
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(4),
                          shape: badge.BadgeShape.square,
                          badgeContent:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Text(
                               depositHistoryModel.status.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width/4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                        intl.DateFormat(" d MMM yyyy ").format(
                      DateTime.parse( depositHistoryModel.createdAt!.split("T")[0].toString(),),).toString(),

                          textDirection: TextDirection.ltr,

                          // DateFormat.yMMMMEEEEd().format().toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            height: 1.2,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        Text(
                          //"₦ ${widget.jobsHistory.amount}",
                          "${depositHistoryModel.quantity!} kg",
                          textDirection: TextDirection.ltr,
                          // DateFormat.yMMMMEEEEd().format().toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            height: 1.2,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        // Text(
                        //     DateFormat.jm().format(DateFormat("hh:mm").parse(widget.jobsHistory.startTime)).toString(),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  getColour() {
    if(depositHistoryModel.status == "pending"){
      return AppColors.red;
    }  else if (depositHistoryModel.status == "accepted"){
      return AppColors.yellow;
    } else {
      return AppColors.green;
    }
  }
}
