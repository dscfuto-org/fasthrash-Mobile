// import 'package:flutter/material.dart';
//
// class MyLocationButton extends StatelessWidget {
//   final VoidCallback onTap;
//   const MyLocationButton({
//     super.key,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Container(
//           margin: const EdgeInsets.only(top: 36.0, right: 24),
//           height: 40,
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black12,
//               width: 2,
//             ),
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               const Icon(
//                 Icons.location_pin,
//                 color: Colors.white,
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 'My Location',
//                 style: Theme.of(context).textTheme.headline6?.copyWith(
//                       color: Colors.white,
//                     ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
