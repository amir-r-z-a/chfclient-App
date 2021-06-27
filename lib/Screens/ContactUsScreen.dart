import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/back2.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 30),
                  text: 'Chamir',
                  waveColor: Colors.purple,
                  boxBackgroundColor: Colors.lightGreenAccent,
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 100.0,
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
