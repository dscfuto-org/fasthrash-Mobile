import 'package:badges/badges.dart' as badge;
import 'package:fastrash/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///import 'package:intl/intl.dart' as intl;

class HistoryCard extends StatelessWidget {
  final int index;
  const HistoryCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String todayDate =
        '${currentDate.day}-${currentDate.month}-${currentDate.year}';

    //print(widget.jobsHistory.startDate.split('').reversed.join());
    //var formatter = intl.DateFormat('dd-MM-yyyy');
    //DateTime selectedStartDate = DateTime.now();
    // var startDateGet =
    // formatter.format(DateTime.parse(widget.jobsHistory.startDate));
    // print(selectedStartDate);
    // print(startDateGet.replaceAll("-", "/"));

    var width = MediaQuery.of(context).size.width;
    // return Card(
    //   elevation: 4,
    //   child: ListTile(
    //     leading: Container(
    //       height: 50,
    //       width: 50,
    //       margin: const EdgeInsets.symmetric(vertical: 8),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       child: const FlutterLogo(),
    //     ),
    //     title:  Text('Item $index'),
    //     subtitle:  Text('Decription $index'),
    //     trailing: Text(todayDate),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          //print(widget.jobsHistory.provider.email.toString());
          // pushNewScreen(
          //   context,
          //   screen: HistoryDetailsScreen(
          //     bookingHistoryModel: widget.jobsHistory,
          //   ),
          //   withNavBar: false, // OPTIONAL VALUE. True by default.
          //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
        },
        //  onTap: () => navigatePush(context, BookingDetailsScreen()),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    child: const SizedBox(
                        height: 10,
                        width: 10,
                        child: Icon(CupertinoIcons.trash),
                        // child: Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Image.asset(
                        //     mapPin,
                        //   ),
                        // )
                    ),
                  ),
                  SizedBox(
                    width: width * 0.15 / 6.5,
                  ),
                  SizedBox(
                    width: width/2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          // StringUtils.capitalize(
                          //     "${widget.jobsHistory.jobTitle} "),
                              "Ihiagwa, Imo state",
                          maxLines: 1, overflow: TextOverflow.ellipsis,

                          /// textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'DMSans',
                              fontSize: 15.sp,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          // widget.jobsHistory.place.address +
                          //     ", " +
                          //     widget.jobsHistory.place.state,
                          "45$index kg",
                          maxLines: 1, overflow: TextOverflow.ellipsis,

                          /// textDirection: TextDirection.UNKNOWN,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            height: 1.2,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        badge.Badge(
                          elevation: 0,
                          badgeColor: AppColors.green,
                          toAnimate: false,
                          borderRadius: BorderRadius.circular(20),
                          padding: const EdgeInsets.all(4),
                          shape: badge.BadgeShape.square,
                          badgeContent: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Text(
                             // widget.jobsHistory.jobStatus,
                              "Collected",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width/5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          todayDate.replaceAll("-", "/"),
                          textDirection: TextDirection.ltr,

                          // DateFormat.yMMMMEEEEd().format().toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            height: 1.2,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        const Text(
                          //"₦ ${widget.jobsHistory.amount}",
                          "₦500",
                          textDirection: TextDirection.ltr,
                          // DateFormat.yMMMMEEEEd().format().toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            height: 1.2,
                            //fontFamily: 'DMSans',
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
}
