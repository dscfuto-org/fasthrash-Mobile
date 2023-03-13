import 'package:fastrash/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// const loaderOne = Padding(
//     padding: EdgeInsets.all(18.0),
//     child: CircularProgressIndicator(
//       color: Colors.red,
//       backgroundColor: Colors.red,
//
//     ));


const loaderOne =  Padding(
  padding:  EdgeInsets.all(18.0),
  child: SpinKitCircle(
    color: AppColors.green,
    size: 50,
  ),
);

const loaderTwo = CircularProgressIndicator(
  color: Colors.green,
  backgroundColor: Colors.red,
  value: 25.0,
);
