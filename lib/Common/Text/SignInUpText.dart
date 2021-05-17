import 'package:flutter/material.dart';

class SignInUpText extends StatelessWidget {
  final String text;

  SignInUpText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 26, color: Color.fromRGBO(53, 66, 74, 1)),
      ),
    );
  }
}
