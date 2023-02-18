import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final int index;
  const HistoryCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String todayDate =
        '${currentDate.day}-${currentDate.month}-${currentDate.year}';
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: const FlutterLogo(),
        ),
        title:  Text('Item $index'),
        subtitle:  Text('Decription $index'),
        trailing: Text(todayDate),
      ),
    );
  }
}
