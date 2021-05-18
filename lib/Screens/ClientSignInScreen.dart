import 'package:chfclient/Classes/Accounts.dart';
import 'package:chfclient/Common/Text/GrayText.dart';
import 'package:chfclient/Common/Text/MyPassFormField.dart';
import 'package:chfclient/Common/Text/MyTextFormField.dart';
import 'package:chfclient/Common/Text/SignInUpText.dart';
import 'package:chfclient/Common/Text/TitleText.dart';
import 'package:chfclient/Common/Text/WhiteText.dart';
import 'package:flutter/material.dart';

class ClientSignInScreen extends StatefulWidget {
  @override
  _ClientSignInScreenState createState() => _ClientSignInScreenState();
}

class _ClientSignInScreenState extends State<ClientSignInScreen> {
  var key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key1,
        child: Container(
          child: ListView(
              padding: EdgeInsets.fromLTRB(50, 175, 50, 100),
              children: [
                SignInUpText("Sign In"),
                Padding(padding: EdgeInsets.all(10)),
                GrayText("Hi there! Nice to see you again.", 0xff989eb1, 16),
                Padding(padding: EdgeInsets.all(10)),
                MyTextFormField(
                  "Phone number",
                  hint: "example: 0912XXXXXXX",
                  regex: 'PNSignIn',
                ),
                Padding(padding: EdgeInsets.all(10)),
                MyPassFormField(
                  'Password',
                  regex: 'PassSignIn',
                  hint: 'Your password',
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1)),
                  onPressed: () {
                    if (key1.currentState.validate()) {
                      key1.currentState.save();
                      print("done");
                      print('index: ');
                      print(Accounts.currentAccount);
                      print("Welcome to Chamir food");
                      Navigator.pushNamed(context, '/MainMenuScreen');
                    }
                  },
                  child: WhiteText('Sign In'),
                ),
                Padding(padding: EdgeInsets.all(20)),
                GestureDetector(
                  onTap: () {
                    // print("tap");
                    Navigator.pushNamed(context, '/ClientSignUpScreen');
                  },
                  child: Center(
                      child: TitleText(
                    'Sign Up',
                    fontSize: 18,
                  )),
                ),
              ]),
        ),
      ),
    );
  }
}
