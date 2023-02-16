import 'package:flutter/material.dart';

class My_acccount_screen extends StatelessWidget {
  const My_acccount_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: 200,
            ),
            child: Image.asset('assets/images/Screenshot (1).png'),
            decoration: BoxDecoration(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
