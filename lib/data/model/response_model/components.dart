// import 'package:flutter/material.dart';
// import './../../../app_constants.dart';

// class CustomCard extends StatelessWidget {
//   CustomCard(
//       {this.backgroundColor,
//       @required this.onpressed,
//       @required this.iconSize,
//       @required this.icon,
//       @required this.txt,
//       this.iconColor});

//   final Function onpressed;
//   final double iconSize;
//   final IconData icon;

//   final Color backgroundColor;
//   final String txt;

//   final Color iconColor;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(child: Container()),
//           IconButton(
//             color: iconColor,
//             onPressed: onpressed,
//             iconSize: iconSize,
//             icon: Icon(icon),
//           ),
//           Expanded(
//             child: Container(),
//           ),
//           Text(
//             txt,
//             style: TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontFamily: scostudent_MEDIUM_FONT,
//                 fontSize: iconSize / 3),
//           ),
//           Expanded(
//             child: Container(),
//           )
//         ],
//       ),
//     ));
//   }
// }
