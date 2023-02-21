import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          centerTitle: true,
            automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size(30, 50.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: Container(
                padding: EdgeInsets.only(bottom: 10.h),
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,

                    indicator: BoxDecoration(

                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.yellow),
                    padding: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                    ),
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        child: Tab(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              'Collections',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20.h,
                        child: Tab(
                          child: Text(
                            'Deposits',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          elevation: 0,
        ),
        body:
        TabBarView(children: [
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],),
              ),
              SizedBox(
                height: 560.h,
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
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
                              fontFamily: 'Euclid Circular A',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],),
              ),
              SizedBox(
                height: 560.h,
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
        ]),


      ),
    );
  }
}
