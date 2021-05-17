// import 'package:flutter/material.dart';
//
// class MyOnChip extends StatefulWidget {
//   String input;
//   int index;
//   bool chipController1 = false;
//   bool chipController2 = false;
//   bool chipController3 = false;
//   Function function;
//
//   MyOnChip(this.input, this.index, this.function);
//
//   @override
//   _MyOnChipState createState() => _MyOnChipState();
// }
//
// class _MyOnChipState extends State<MyOnChip> {
//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       backgroundColor: Colors.blue,
//       avatar: Icon(
//         Icons.check,
//         color: Colors.white,
//       ),
//       label: Text(
//         widget.input,
//         style: TextStyle(color: Colors.white),
//       ),
//       onSelected: (value) {
//         setState(() {
//           if (widget.index == 1) {
//             widget.chipController1 = !widget.chipController1;
//           } else if (widget.index == 2) {
//             widget.chipController2 = !widget.chipController2;
//           } else {
//             widget.chipController3 = !widget.chipController3;
//           }
//         });
//         widget.function();
//       },
//     );
//   }
// }
