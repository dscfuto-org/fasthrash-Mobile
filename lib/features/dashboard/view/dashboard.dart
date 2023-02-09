import 'package:fastrash/features/dashboard/data/nav_bar_list.dart';
import 'package:fastrash/features/dashboard/widgets/bottom_nav_bar_items.dart';
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
        bottomNavigationBar: const BottomNavBar(),
        body: TabBarView(
          children: navBar,
        ),
      ),
    );
  }
}

