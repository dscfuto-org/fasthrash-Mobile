
import 'package:fastrash/constants/strings.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget customButton (labelText, {
required TextEditingController textEditingController, bool isDigits = false, bool decimal = false
}){
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      controller: textEditingController,
     keyboardType:  isDigits? TextInputType.numberWithOptions(decimal: decimal,):TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return fieldRequired;
        }
        return null;
      },
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