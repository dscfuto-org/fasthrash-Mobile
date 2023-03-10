import 'package:fastrash/features/education/view/education.dart';
import 'package:fastrash/features/history/view/history.dart';
import 'package:fastrash/features/home/view/home.dart';
import 'package:fastrash/features/profile/my_account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white54,
          child: const TabBar(
            isScrollable: false,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.transparent,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                text: "Home",
                icon: Icon(CupertinoIcons.home),
              ),
              Tab(
                text: "History",
                //icon: Icon(Icons.history),
                icon: Icon(Icons.history),
              ),
              Tab(
                text: "Education",
                icon: Icon(CupertinoIcons.news),
              ),
              Tab(
                text: "Profile",
                icon: Icon(CupertinoIcons.person),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeView(),
            HistoryView(),
            EducationView(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}

