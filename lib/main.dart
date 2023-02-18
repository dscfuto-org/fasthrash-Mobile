import 'package:fastrash/features/dashboard/view/dashboard.dart';
import 'package:fastrash/features/education/view/education.dart';
import 'package:fastrash/features/history/view/history.dart';
import 'package:fastrash/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastTrash Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EducationView()
    );
  }
}