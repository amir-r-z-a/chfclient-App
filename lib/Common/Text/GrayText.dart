import 'package:flutter/material.dart';

class GrayText extends StatelessWidget {
  final String text;
  final int hex;
  final double fontSize;

  GrayText(this.text, this.hex, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: Color(hex)),
      ),
    );
  }
}
