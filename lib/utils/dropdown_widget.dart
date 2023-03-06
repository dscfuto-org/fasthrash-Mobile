// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class DashBoardDropDownFormField extends StatefulWidget {
//   String setValue;
//   final String label;
//   final List<dynamic> items;
//   DashBoardDropDownFormField(
//       {super.key,
//       required this.setValue,
//       required this.label,
//       required this.items});
//
//   dynamic getValue() {
//     return setValue;
//   }
//
//   @override
//   State<DashBoardDropDownFormField> createState() =>
//       _DashBoardDropDownFormFieldState();
// }
//
// class _DashBoardDropDownFormFieldState
//     extends State<DashBoardDropDownFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return FormField<String>(builder: (FormFieldState<String> state) {
//       return DropdownButtonFormField(
//         icon: const Icon(Icons.arrow_drop_down_circle, color: CupertinoColors.systemGrey,),
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.r)),
//               label: Text(widget.label, style: TextStyle(fontSize: 14.sp),),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(7.r),
//                 borderSide:  BorderSide(width: 2.w, color: Colors.blue),
//               )),
//           isExpanded: true,
//           items: widget.items.map<DropdownMenuItem<dynamic>>((dynamic value) {
//             return DropdownMenuItem<dynamic>(
//               value: value,
//               child: Text(value, style: TextStyle(fontSize: 14.sp),),
//             );
//           }).toList(),
//           onChanged: (value) {
//             widget.setValue = value!;
//           });
//     });
//   }
// }
