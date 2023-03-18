import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/features/history/view/user_history_screen.dart';
import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:fastrash/repository/data/response_data.dart';
import 'package:fastrash/repository/model/collections_history_model.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/repository/services/bloc.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectorHistoryScreen extends StatefulWidget {
  const CollectorHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CollectorHistoryScreen> createState() => _CollectorHistoryScreenState();
}

class _CollectorHistoryScreenState extends State<CollectorHistoryScreen> {
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
                      ResponseData.profileResponseModel!.data!.user!.role.toString() == "user"
                      ? Container() : Container(
                        alignment: Alignment.center,
                        child: Tab(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              'Collections',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'DMSans',
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
                              fontFamily: 'DMSans',
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
          Container(
            color: Colors.white,
            child: StreamBuilder<List<CollectionsHistoryModel>>(
              stream: bloc.collectorSubject.stream,
              builder: (context, AsyncSnapshot<List<CollectionsHistoryModel>> snapshot) {
                ///logger.w(snapshot.data);
                if (snapshot.hasData) {
                  return CollectionsHistoryListView(depositHistoryModel: snapshot.data);
                } else if (snapshot.hasError) {
                  return buildErrorWidget(snapshot.error);
                } else {
                  return Center(child: buildLoadingWidget());
                }
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: StreamBuilder<List<DepositHistoryModel>>(
              stream: bloc.depositSubject.stream,
              builder: (context, AsyncSnapshot<List<DepositHistoryModel>> snapshot) {
                logger.w(snapshot.data);
                if (snapshot.hasData) {
                  return DepositHistoryListView(depositHistoryModel: snapshot.data,);
                } else if (snapshot.hasError) {
                  return buildErrorWidget(snapshot.error);
                } else {
                  return Center(child: buildLoadingWidget());
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class CollectionsHistoryListView extends StatefulWidget {
  final List<CollectionsHistoryModel>? depositHistoryModel;

  const CollectionsHistoryListView({super.key, this.depositHistoryModel});



  @override
  CollectionsHistoryListViewState createState() => CollectionsHistoryListViewState();
}


class CollectionsHistoryListViewState extends State<CollectionsHistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 650.h,
        width: MediaQuery.of(context).size.width,
        ///color: Colors.red,
        child: widget.depositHistoryModel!.isEmpty
            ? SizedBox(
          height: 600.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No  History", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),),
              // SizedBox(height: 200.h,
              //     child: Image.asset(invoiceIcon))
            ],
          ),
        )
            : ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return HistoryCard(
              collectorType: "Collections",
              depositHistoryModel: widget.depositHistoryModel![index],
            );
          },
          itemCount: widget.depositHistoryModel!.length,
        ),
      ),
    );
  }


}

