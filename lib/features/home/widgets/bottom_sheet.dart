import 'package:fastrash/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

actionsModalBottomSheet(
  BuildContext context,
) {
  double sheetHeight = MediaQuery.of(context).size.height/1.05;
  showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.r),
                  height: sheetHeight,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.black45,
                          height: 5,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const PickImage(),

                        SizedBox(
                          height: 50.h,
                        ),

                        SizedBox(
                          height: 450.h,
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      });
}

