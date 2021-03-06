import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;

  WhiteText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
