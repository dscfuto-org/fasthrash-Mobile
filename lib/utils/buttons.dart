
import 'package:fastrash/constants/app_colors.dart';
import 'package:fastrash/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLargeButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function() onTap;
  final bool isBorder;
  const AppLargeButton(  {super.key,
    this.backgroundColor = AppColors.green,
    required this.textColor,
    required this.onTap ,
    this.isBorder =false,
    required this.text}
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //margin: const EdgeInsets.only(left:15, right:30 ),
        //margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 56.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width:1.w,
            color:AppColors.green,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: kSubtitleStyle.copyWith(
              color: textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}