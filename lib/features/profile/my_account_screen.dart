import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
            constraints: const BoxConstraints.expand(
              height: 200,
            ),
            child: Image.asset('assets/images/Screenshot (1).png'),
            decoration: const BoxDecoration(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
