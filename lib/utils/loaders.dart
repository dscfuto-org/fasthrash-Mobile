// We declare and Initialize our Loaders here if any

import 'package:flutter/material.dart';


const loaderOne = Padding(
  padding: EdgeInsets.all(18.0),
  child: CircularProgressIndicator(
    color:Colors.black, backgroundColor: Colors.white,
  )
);

const loaderTwo = CircularProgressIndicator(
  color:Colors.black, backgroundColor: Colors.white,
  value: 30.0,
);
