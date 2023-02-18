import 'package:fastrash/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Center(
            child: Text('Education coming soon!'),
          ),
          const PickImage()
        ],
      ),
    );
  }
}
