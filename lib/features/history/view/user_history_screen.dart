import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHistoryScreen extends StatefulWidget {
  const UserHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UserHistoryScreen> createState() => _UserHistoryScreenState();
}

class _UserHistoryScreenState extends State<UserHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        backgroundColor:
                        // widget.bookingHistoryModel.jobStatus == "Paid"
                        //     ? Colors.green :
                        Colors.grey,
                        padding: const EdgeInsets.all(5.0),
                        // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
                        label: Text(
                          "All History",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        backgroundColor:
                        // widget.bookingHistoryModel.jobStatus == "Paid"
                        //     ? Colors.green :
                        AppColors.grey,
                        padding: const EdgeInsets.all(5.0),
                        // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
                        label: Text(
                          "Pending",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        backgroundColor:
                        // widget.bookingHistoryModel.jobStatus == "Paid"
                        //     ? Colors.green :
                        AppColors.grey,
                        padding: const EdgeInsets.all(5.0),
                        // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
                        label: Text(
                          "Accepted",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        backgroundColor:
                        // widget.bookingHistoryModel.jobStatus == "Paid"
                        //     ? Colors.green :
                        Colors.green,
                        padding: const EdgeInsets.all(5.0),
                        // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
                        label: Text(
                          "Collected",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],),
              ),
              SizedBox(
                height: 650.h,
                child: ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          HistoryCard(
                            index: index + 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
