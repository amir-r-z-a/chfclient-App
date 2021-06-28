import 'dart:io';

import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Text/ClientMyPassFormField.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/main.dart';
import 'package:flutter/material.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  var _key1 = GlobalKey<FormState>();
  var _formkey = GlobalKey<FormState>();
  TextEditingController _controllerOldPass = TextEditingController();
  TextEditingController _controllerNewPass = TextEditingController();
  TextEditingController _controllerConfirmPass = TextEditingController();

  bool validateOldPass = false;
  bool validateNewPass = false;

  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _isObscure2 = true;

  bool validatePhoneNumber = false;
  String _controllerPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F1F7),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 0, 5),
              child: Text(
                'Features',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA4A2A5)),
              ),
            ),
            Form(
              key: _key1,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 360,
                          child: ClientMyTextFormField(
                            'Name',
                            index: 1,
                            initial: ClientAccounts
                                .accounts[ClientAccounts.currentAccount].name,
                            addToAccounts: true,
                            hint: 'Edit Your Name',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.phone),
                        ),
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            initialValue: MyApp.id,
                            validator: (value) {
                              _controllerPhoneNumber = value;
                              if (value == null || value.isEmpty) {
                                return "Please enter something";
                              } else if (ClientAccounts.validPhoneNumber(
                                  _controllerPhoneNumber)) {
                                return 'Your phone number is not valid';
                              } else if (validatePhoneNumber) {
                                return 'Your phone number is already registered';
                              }
                              return null;
                            },
                            cursorColor: Color.fromRGBO(248, 95, 106, 1),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Color.fromRGBO(248, 95, 106, 1),
                              ),
                              labelText: 'PhoneNumber',
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(248, 95, 106, 1)),
                              hintText: 'Edit Your PhoneName',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(209, 214, 219, 1),
                              ),
                            ),
                          ),
                          // ClientMyTextFormField(
                          //   'Phone Number',
                          //   index: 2,
                          //   initial: ClientAccounts
                          //       .accounts[ClientAccounts.currentAccount]
                          //       .phoneNumber,
                          //   addToAccounts: true,
                          //   hint: 'Edit Your Number',
                          // ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.alternate_email),
                        ),
                        SizedBox(
                          width: 360,
                          child: ClientMyTextFormField(
                            'Email',
                            index: 4,
                            addToAccounts: true,
                            initial: ClientAccounts
                                .accounts[ClientAccounts.currentAccount].email,
                            regex: 'Email',
                            hint: 'Edit Your Email',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      String name = ClientMyTextFormField.name;
                      String email = ClientMyTextFormField.email;
                      if (_key1.currentState.validate()) {
                        _key1.currentState.save();
                        String listen = '';
                        bool phoneNumber = false;
                        int numOfPhoneNumber = -1;
                        await Socket.connect(MyApp.ip, 2442)
                            .then((serverSocket) {
                          print('connected writer');
                          String write = 'ClientEditProfile-feature';
                          if (name != ClientMyTextFormField.name) {
                            write += '-name-';
                            write += (MyApp.id + '-');
                            write += ClientMyTextFormField.name;
                          }
                          if (email != ClientMyTextFormField.email) {
                            write += '-email-';
                            write += (MyApp.id + '-');
                            write += ClientMyTextFormField.email;
                          }
                          if (MyApp.id != _controllerPhoneNumber) {
                            write += '-phoneNumber-';
                            write += (MyApp.id + '-');
                            write += _controllerPhoneNumber;
                            phoneNumber = true;
                            numOfPhoneNumber++;
                          }
                          write = (write.length + 7).toString() +
                              ',Client-' +
                              write;
                          serverSocket.write(write);
                          serverSocket.flush();
                          print('write: ' + write);
                          print('connected listen');
                          serverSocket.listen((socket) {
                            listen = String.fromCharCodes(socket)
                                .trim()
                                .substring(2);
                          }).onDone(() {
                            print("listen: " + listen);
                            if (phoneNumber) {
                              validatePhoneNumber =
                                  listen.split('-')[numOfPhoneNumber] ==
                                      'invalid';
                              String safeControllerPhoneNumber =
                                  _controllerPhoneNumber;
                              if (_key1.currentState.validate()) {
                                MyApp.id = safeControllerPhoneNumber;
                                ClientAccounts
                                    .accounts[ClientAccounts.currentAccount]
                                    .phoneNumber = safeControllerPhoneNumber;
                              } else {
                                validatePhoneNumber = false;
                              }
                            }
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .name = ClientMyTextFormField.name;
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .email = ClientMyTextFormField.email;
                          });
                          // serverSocket.close();
                        });
                        print('Features was changed');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    child: Text('Save'))
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 0, 5),
              child: Text(
                'Password',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA4A2A5)),
              ),
            ),
            Form(
              key: _formkey,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _controllerOldPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something";
                        } else if (validateOldPass) {
                          return 'Your input does not match your old password';
                        }
                        return null;
                      },
                      cursorColor: Color.fromRGBO(248, 95, 106, 1),
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(248, 95, 106, 1),
                                width: 2.0)),
                        errorStyle: TextStyle(
                          color: Color.fromRGBO(248, 95, 106, 1),
                        ),
                        suffixIcon: IconButton(
                          color: Color.fromRGBO(248, 95, 106, 1),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Old Password',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(248, 95, 106, 1)),
                        hintText: 'Your old Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(209, 214, 219, 1),
                        ),
                      ),
                    ),
                    // ClientMyPassFormField(
                    //   'Old Password',
                    //   regex: 'PassEdit1',
                    //   hint: 'Your old Password',
                    // ),
                    TextFormField(
                      controller: _controllerNewPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something";
                        } else if (ClientAccounts.validPassword(value)) {
                          return 'Your password should contain at least one number and one letter';
                        }
                        return null;
                      },
                      obscureText: _isObscure1,
                      cursorColor: Color.fromRGBO(248, 95, 106, 1),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(248, 95, 106, 1),
                                width: 2.0)),
                        errorStyle: TextStyle(
                          color: Color.fromRGBO(248, 95, 106, 1),
                        ),
                        suffixIcon: IconButton(
                          color: Color.fromRGBO(248, 95, 106, 1),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          },
                          icon: Icon(_isObscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(248, 95, 106, 1)),
                        hintText: 'Your new Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(209, 214, 219, 1),
                        ),
                      ),
                    ),
                    // ClientMyPassFormField(
                    //   'New Password',
                    //   regex: 'PassEdit2',
                    //   hint: 'Your new Password',
                    // ),
                    TextFormField(
                      controller: _controllerConfirmPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something";
                        } else if (validateNewPass) {
                          return 'Your input does not match your new password';
                        }
                        return null;
                      },
                      cursorColor: Color.fromRGBO(248, 95, 106, 1),
                      obscureText: _isObscure2,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(248, 95, 106, 1),
                                width: 2.0)),
                        errorStyle: TextStyle(
                          color: Color.fromRGBO(248, 95, 106, 1),
                        ),
                        suffixIcon: IconButton(
                          color: Color.fromRGBO(248, 95, 106, 1),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          },
                          icon: Icon(_isObscure2
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(248, 95, 106, 1)),
                        hintText: 'Your confirm Password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(209, 214, 219, 1),
                        ),
                      ),
                    ),
                    // ClientMyPassFormField(
                    //   'Confirm Password',
                    //   regex: 'PassEdit3',
                    //   hint: 'Your confirm Password',
                    // ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => checkerPassword()
                  // {
                  // if (_formkey.currentState.validate()) {
                  //   _formkey.currentState.save();
                  //   print('Yor password was changed');
                  // }
                  // }
                  ,
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkerPassword() async {
    print('tap password');
    //baraye safe boodan bishtar bayad chek kardan null va chek kardan validPassword ham inja anjam shavad
    //manzoor az safe boodan in ast ke vaqti controller chek mishavad momken ast bad az check shodan controller karbar voroodi digari vared konad va vaqti dobare az controller estefade mikonim meqdar jadid ke check nashode estefade mishavad
    //dar kol barname in masale check shavad
    if (_formkey.currentState.validate()) {
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String newPassword = _controllerNewPass.text;
        String write = 'ClientEditProfile-password-' +
            MyApp.id +
            '-' +
            _controllerOldPass.text +
            '-' +
            newPassword +
            '-' +
            _controllerConfirmPass.text;
        write = (write.length + 7).toString() + ',Client-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
          List<String> split = listen.split('-');
          validateOldPass = split[0] == 'invalid';
          validateNewPass = split[1] == 'invalid';
          if (_formkey.currentState.validate()) {
            _controllerOldPass.clear();
            _controllerNewPass.clear();
            _controllerConfirmPass.clear();
            ClientAccounts.accounts[ClientAccounts.currentAccount].password =
                newPassword;
            print('password changed');
          } else {
            validateOldPass = false;
            validateNewPass = false;
          }
        });
      });
    }
  }
}
