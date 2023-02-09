import 'package:fastrash/features/education/view/education.dart';
import 'package:fastrash/features/history/view/history.dart';
import 'package:fastrash/features/home/view/home.dart';
import 'package:fastrash/features/profile/view/profile.dart';
import 'package:flutter/material.dart';

List<Widget> navBar = const[
  HomeView(),
  HistoryView(),
  Education(),
  ProfileView(),
];
