import 'package:fastrash/features/history/widgets/history_card.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HistoryCard(
            index: index + 1,
          );
        },
      ),
    );
  }
}
