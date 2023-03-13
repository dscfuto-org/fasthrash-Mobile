import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/repository/services/bloc.dart';
import 'package:fastrash/utils/custom_print.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(right: 4),
            //         child: Chip(
            //           backgroundColor:
            //           // widget.bookingHistoryModel.jobStatus == "Paid"
            //           //     ? Colors.green :
            //           Colors.grey,
            //           padding: const EdgeInsets.all(5.0),
            //           // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //           label: Text(
            //             "All History",
            //             textAlign: TextAlign.center,
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10.sp,
            //                 fontFamily: 'DMSans',
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 4),
            //         child: Chip(
            //           backgroundColor:
            //           // widget.bookingHistoryModel.jobStatus == "Paid"
            //           //     ? Colors.green :
            //           AppColors.grey,
            //           padding: const EdgeInsets.all(5.0),
            //           // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //           label: Text(
            //             "Pending",
            //             textAlign: TextAlign.center,
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10.sp,
            //                 fontFamily: 'DMSans',
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 4),
            //         child: Chip(
            //           backgroundColor:
            //           // widget.bookingHistoryModel.jobStatus == "Paid"
            //           //     ? Colors.green :
            //           AppColors.grey,
            //           padding: const EdgeInsets.all(5.0),
            //           // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //           label: Text(
            //             "Accepted",
            //             textAlign: TextAlign.center,
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10.sp,
            //                 fontFamily: 'DMSans',
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //       Padding(padding: const EdgeInsets.only(right: 4),
            //         child: Chip(
            //           backgroundColor:
            //           // widget.bookingHistoryModel.jobStatus == "Paid"
            //           //     ? Colors.green :
            //           Colors.green,
            //           padding: const EdgeInsets.all(5.0),
            //           // backgroundColor: AppColors.mainColor2.withOpacity(0.5),
            //           label: Text(
            //             "Collected",
            //             textAlign: TextAlign.center,
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 10.sp,
            //                 fontFamily: 'DMSans',
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //     ],),
            // ),
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
            )
          ],
        ),
      ),
    );
  }
}



class DepositHistoryListView extends StatefulWidget {
  final List<DepositHistoryModel>? depositHistoryModel;

  const DepositHistoryListView({super.key, this.depositHistoryModel});



  @override
  DepositHistoryListViewState createState() => DepositHistoryListViewState();
}


class DepositHistoryListViewState extends State<DepositHistoryListView> {
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
              depositHistoryModel: widget.depositHistoryModel![index],
            );
          },
          itemCount: widget.depositHistoryModel!.length,
        ),
      ),
    );
  }


}
