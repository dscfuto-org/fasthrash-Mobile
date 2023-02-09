import 'package:fastrash/features/home/widgets/bottom_sheet.dart';
import 'package:fastrash/features/home/widgets/google_map.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const GMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => actionsModalBottomSheet(context),
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
