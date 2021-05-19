import 'package:chfclient/Classes/Accounts.dart';
import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Common/Text/GrayText.dart';
import 'package:chfclient/Common/Text/MyPassFormField.dart';
import 'package:chfclient/Common/Text/MyTextFormField.dart';
import 'package:chfclient/Common/Text/TitleText.dart';
import 'package:chfclient/Common/Text/WhiteText.dart';
import 'package:flutter/material.dart';

class ClientSignUpScreen extends StatefulWidget {
  @override
  _ClientSignUpScreenState createState() => _ClientSignUpScreenState();
}

class _ClientSignUpScreenState extends State<ClientSignUpScreen> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(25, 50, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(30),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      MyTextFormField(
                        "Name",
                        hint: "Your name",
                        index: 1,
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Phone number",
                        index: 2,
                        hint: "Your Phone number",
                        regex: 'PNSignUp',
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyPassFormField(
                        'Password',
                        regex: 'PassSignUp',
                        hint: 'Your password',
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      MyTextFormField(
                        "Address",
                        hint: "Your Address",
                        index: 3,
                      ),

                      // Padding(padding: EdgeInsets.all(15)),
                      //TimePicker for open and close
                      Padding(padding: EdgeInsets.all(10)),
                      Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GrayText("Have an Account ?", 0xff989eb1, 16),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/ClientSignInScreen");
                      },
                      child: TitleText(
                        'Sign In',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 320, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1),
                    ),
                    child: WhiteText("Continue"),
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        setState(() {
                          _formkey.currentState.save();
                          Accounts.addAccount(
                            Client(
                              MyTextFormField.name,
                              MyTextFormField.phoneNumber,
                              MyTextFormField.password,
                              [MyTextFormField.address],
                            ),
                          );
                          Navigator.pushNamed(context, '/ClientSignInScreen');
                          print('-------------------------');
                          print("saved");
                          print('Your len is:');
                          print(Accounts.getLength());
                          print('-------------------------');
                          for (int i = 0; i < Accounts.getLength(); i++) {
                            print('index: ');
                            print(i);
                            print(Accounts.accounts[i].name);
                            print(Accounts.accounts[i].phoneNumber);
                            print(Accounts.accounts[i].password);
                            print(Accounts.accounts[i].address);
                            print('-------------------------');
                          }
                        });
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
