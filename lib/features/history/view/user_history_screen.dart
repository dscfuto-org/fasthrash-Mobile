import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:fastrash/repository/model/deposit_history_model.dart';
import 'package:fastrash/repository/services/bloc.dart';
import 'package:fastrash/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserHistoryScreen extends StatefulWidget {
  const UserHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UserHistoryScreen> createState() => _UserHistoryScreenState();
}

class _UserHistoryScreenState extends State<UserHistoryScreen> {

  // final RefreshController _refreshController = RefreshController(initialRefresh: false);
  //
  // void _onRefresh() async{
  //   bloc.deposit(context);
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //
  //   _refreshController.refreshCompleted();
  // }
  //
  //
  // void _onLoading() async{
  //   bloc.deposit(context);
  //   _refreshController.loadComplete();
  // }
  @override
  void initState() {
    bloc.deposit(context);
    super.initState();
  }
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
          child: Center(child: Text("No  History", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),)),
        )
            : ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final reversedIndex =  widget.depositHistoryModel!.length - 1 - index;
            return HistoryCard(
              collectorType: "Deposit",
              depositHistoryModel: widget.depositHistoryModel![reversedIndex],
            );
          },
          itemCount: widget.depositHistoryModel!.length,
        ),
      ),
    );
  }


}
