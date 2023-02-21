
import 'package:flutter/material.dart';

Widget customButton (labelText){
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    ),
  );
}