// import 'package:flutter/material.dart';
//
// class MyOffChip extends StatefulWidget {
//   String input;
//   int index;
//   bool chipController1 = false;
//   bool chipController2 = false;
//   bool chipController3 = false;
//   Function function;
//
//   MyOffChip(this.input, this.index, this.function);
//
//   @override
//   _MyOffChipState createState() => _MyOffChipState();
// }
//
// class _MyOffChipState extends State<MyOffChip> {
//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       label: Text(widget.input),
//       onSelected: (value) {
//         setState(() {
//           if (widget.index == 1) {
//             widget.chipController2 = false;
//             widget.chipController3 = false;
//             widget.chipController1 = !widget.chipController1;
//           } else if (widget.index == 2) {
//             widget.chipController1 = false;
//             widget.chipController3 = false;
//             widget.chipController2 = !widget.chipController2;
//           } else {
//             widget.chipController1 = false;
//             widget.chipController2 = false;
//             widget.chipController3 = !widget.chipController3;
//           }
//         });
//         widget.function();
//       },
//     );
//   }
// }
