
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

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

OutlineInputBorder focusedBorder() {
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    //borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(  color: AppColors.green));
  return outlineInputBorder;
}