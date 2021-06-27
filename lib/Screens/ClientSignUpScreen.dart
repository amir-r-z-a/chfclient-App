import 'dart:io';

import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfclient/Common/Text/GrayText.dart';
import 'package:chfclient/Common/Text/ClientMyPassFormField.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Common/Text/TitleText.dart';
import 'package:chfclient/Common/Text/WhiteText.dart';
import 'package:chfclient/main.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ClientSignUpScreen extends StatefulWidget {
  @override
  _ClientSignUpScreenState createState() => _ClientSignUpScreenState();
}

class _ClientSignUpScreenState extends State<ClientSignUpScreen> {
  var _formkey = GlobalKey<FormState>();
  var _formkey2 = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  bool validate = false;
  bool validate2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55.0),
        child: SingleChildScrollView(
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
                        Form(
                          key: _formkey2,
                          child: TextFormField(
                            cursorColor: Color.fromRGBO(248, 95, 106, 1),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter something";
                              } else if (validate2) {
                                return 'Your phone number is not valid';
                              } else if (validate) {
                                return 'Your phone number is already registered';
                              }
                              return null;
                            },
                            controller: _controller,
                            onSaved: (newValue) =>
                                ClientMyTextFormField.phoneNumber = newValue,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Color.fromRGBO(248, 95, 106, 1),
                              ),
                              labelText: 'PhoneNumber',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(248, 95, 106, 1)),
                              hintText: 'Your Phone Number',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(209, 214, 219, 1),
                              ),
                            ),
                          ),
                        ),
                        // ClientMyTextFormField(
                        //   "Phone number",
                        //   index: 2,
                        //   hint: "Your Phone number",
                        //   regex: 'PNSignUp',
                        // ),
                        Padding(padding: EdgeInsets.all(15)),
                        Column(
                          children: [
                            ClientMyTextFormField(
                              "Name",
                              hint: "Your name",
                              index: 1,
                            ),
                            Padding(padding: EdgeInsets.all(15)),
                            ClientMyPassFormField(
                              'Password',
                              regex: 'PassSignUp',
                              hint: 'Your password',
                            ),
                            Padding(padding: EdgeInsets.all(50)),
                          ],
                        ),
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
                    constraints:
                        BoxConstraints.tightFor(width: 320, height: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(248, 95, 106, 1),
                      ),
                      child: WhiteText("Continue"),
                      onPressed: () => checker(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checker() async {
    print('starttt');
    bool validAll = _formkey.currentState.validate();
    if (ClientAccounts.validPhoneNumber(_controller.text)) {
      setState(() {
        validate2 = true;
        _formkey2.currentState.validate();
      });
    } else {
      validate2 = false;
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write = 'ClientSignUp-alreadyPhoneNumber-' + _controller.text;
        write = (write.length + 7).toString() + ',Client-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
          bool flag = listen != 'invalid';
          // print('one: ' + flag.toString());
          if (flag) {
            // setState(() {
            validate = true;
            _formkey2.currentState.validate();
            // });
          } else {
            validate = false;
            _formkey2.currentState.validate();
          }
          // print('two: ' + flag.toString());
          if (validAll && !flag) {
            // setState(() {
            _formkey.currentState.save();
            _formkey2.currentState.save();
            ClientAccounts.addAccount(
              Client(
                ClientMyTextFormField.name,
                ClientMyTextFormField.phoneNumber,
                ClientMyTextFormField.password,
                // ClientMyTextFormField.address,
              ),
            );
            print('add account');
            //                             print('-------------------------');
            //                             print("saved");
            //                             print('Your len is:');
            //                             print(ClientAccounts.getClientAccountsLength());
            //                             print('-------------------------');
            //                             for (int i = 0;
            //                                 i < ClientAccounts.getClientAccountsLength();
            //                                 i++) {
            //                               print('index: ');
            //                               print(i);
            //                               print(ClientAccounts.accounts[i].name);
            //                               print(ClientAccounts.accounts[i].phoneNumber);
            //                               print(ClientAccounts.accounts[i].password);
            //                               print(ClientAccounts.accounts[i].address);
            //                               print('-------------------------');
            //                             }
            //                           });
            Navigator.pushNamed(context, '/ClientSignInScreen');
          }
        });
        // serverSocket.close();
      });
    }
  }
}
