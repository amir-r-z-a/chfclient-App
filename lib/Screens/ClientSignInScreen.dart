import 'dart:io';

import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Text/GrayText.dart';
import 'package:chfclient/Common/Text/ClientMyPassFormField.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Common/Text/SignInUpText.dart';
import 'package:chfclient/Common/Text/TitleText.dart';
import 'package:chfclient/Common/Text/WhiteText.dart';
import 'package:chfclient/main.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class ClientSignInScreen extends StatefulWidget {
  @override
  _ClientSignInScreenState createState() => _ClientSignInScreenState();
}

class _ClientSignInScreenState extends State<ClientSignInScreen> {
  var key1 = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  bool _isObscure = true;
  bool validate = false;
  bool validatePass = false;

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
                TextFormField(
                  onSaved: (newValue) {
                    MyApp.id = newValue;
                    MyApp.mode = 'LogIn';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter something";
                    } else if (ClientAccounts.validPhoneNumber(
                        _controller.text)) {
                      return 'Your phone number is not valid';
                    } else if (validate) {
                      return "Your phone number is not found";
                    }
                    return null;
                  },
                  controller: _controller,
                  cursorColor: Color.fromRGBO(248, 95, 106, 1),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Color.fromRGBO(248, 95, 106, 1),
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(248, 95, 106, 1)),
                    hintText: 'example: 0912XXXXXXX',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 214, 219, 1),
                    ),
                  ),
                ),
                // ClientMyTextFormField(
                //   "Phone number",
                //   hint: "example: 0912XXXXXXX",
                //   regex: 'PNSignIn',
                // ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "You must fill this box";
                    } else if (validatePass) {
                      return "Your password is not correct";
                    }
                    return null;
                  },
                  controller: _controllerPass,
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
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(248, 95, 106, 1)),
                    hintText: 'Your password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(209, 214, 219, 1),
                    ),
                  ),
                ),
                // ClientMyPassFormField(
                //   'Password',
                //   regex: 'PassSignIn',
                //   hint: 'Your password',
                // ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(248, 95, 106, 1)),
                  onPressed: () => checker(),
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

  void checker() async {
    print("tap");
    if (key1.currentState.validate()) {
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String phoneNumber = _controller.text;
        String write =
            'ClientSignIn-' + phoneNumber + '-' + _controllerPass.text;
        write = (write.length + 7).toString() + ',Client-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() async {
          print("listen: " + listen);
          validate = listen == 'invalid';
          validatePass = listen == 'invalid-match';
          if (key1.currentState.validate()) {
            key1.currentState.save();
            // for (int i = 0; i < Accounts.getLength(); i++) {
            //   if (Accounts.accounts[i].phoneNumber == phoneNumber) {
            //     Accounts.currentAccount = i;
            //   }
            // }
            String listen = '';
            await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
              print('connected writer');
              String write = 'ClientGetData-account-' + MyApp.id;
              write = (write.length + 7).toString() + ',Client-' + write;
              serverSocket.write(write);
              serverSocket.flush();
              print('write: ' + write);
              print('connected listen');
              serverSocket.listen((socket) {
                listen = String.fromCharCodes(socket).trim().substring(2);
              }).onDone(() {
                print("listen: " + listen);
                // Restaurant restaurant =start(listen) ;
                runMenu(start(listen));
                print("Welcome to Chamir food");
                print('A: ' + ClientAccounts.accounts.toString());
                print('CA: ' + ClientAccounts.currentAccount.toString());
                Navigator.pushNamed(context, '/ClientMainMenuScreen');
              });
            });
          } else {
            validate = false;
            validatePass = false;
          }
        });
      });
    }
  }

  Client start(String ans) {
    if (ans != null && ans.isNotEmpty) {
      ClientAccounts.key = true;
      List<String> strings = ans.split(', ');
      ClientAccounts.accounts = [];
      Client client = ClientAccounts.addAccount(
          Client(strings[1], ans.substring(0, ans.indexOf(':')), strings[2]));
      if (strings[3] != 'null') {
        client.email = strings[3];
      }
      if (strings[4] != 'null') {
        client.address[client.currentAddress].address = strings[4];
      }
      if (strings[5] != 'null') {
        String latitude = strings[5]
            .substring(strings[5].indexOf(':') + 1, strings[5].indexOf(':::'));
        String longitude = strings[5].substring(
            strings[5].lastIndexOf(':') + 1, strings[5].indexOf(')'));
        LatLng latLng = LatLng(double.parse(latitude), double.parse(longitude));
        client.address[client.currentAddress].location = strings[5];
        client..address[client.currentAddress].tappedPoints.add(latLng);
      }
      if (strings[6] != 'null') {
        client.wallet = double.parse(strings[6]);
      }
      if (strings[7] != 'null') {
        List<String> date = strings[7].split(':');
        client.lastIncrease = Date(
            year: date[0],
            month: date[1],
            day: date[2],
            hour: date[3],
            minute: date[4],
            second: date[5]);
      }
      // if (strings[9] != 'null') {
      //   restaurant.radiusOfWork = double.parse(strings[9]);
      // }
      // if (strings[10] != 'null') {
      //   restaurant.point = double.parse(strings[9]);
      // }
      print('start');
      return client;
    }
    return null;
  }

  void runMenu(Client client) async {
    if (client != null) {
      String listenFav = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write = 'ClientGetData-clientFavRestaurants-' + MyApp.id;
        write = (write.length + 7).toString() + ',Client-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listenFav = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() async {
          print("listen: " + listenFav);
          // todo
          String listenAddresses = '';
          await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
            print('connected writer');
            String write = 'ClientGetData-clientAddresses-' + MyApp.id;
            write = (write.length + 7).toString() + ',Client-' + write;
            serverSocket.write(write);
            serverSocket.flush();
            print('write: ' + write);
            print('connected listen');
            serverSocket.listen((socket) {
              listenAddresses =
                  String.fromCharCodes(socket).trim().substring(2);
            }).onDone(() async {
              print("listen: " + listenAddresses);
              // todo
              String listenComments = '';
              await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                print('connected writer');
                String write = 'ClientGetData-clientComments-' + MyApp.id;
                write = (write.length + 7).toString() + ',Client-' + write;
                serverSocket.write(write);
                serverSocket.flush();
                print('write: ' + write);
                print('connected listen');
                serverSocket.listen((socket) {
                  listenComments =
                      String.fromCharCodes(socket).trim().substring(2);
                }).onDone(() async {
                  print("listen: " + listenComments);
                  // todo
                  String listenAccounts = '';
                  await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
                    print('connected writer');
                    String write = 'RestaurantGetData-accounts-' + MyApp.id;
                    write =
                        (write.length + 11).toString() + ',Restaurant-' + write;
                    serverSocket.write(write);
                    serverSocket.flush();
                    print('write: ' + write);
                    print('connected listen');
                    serverSocket.listen((socket) {
                      listenAccounts =
                          String.fromCharCodes(socket).trim().substring(2);
                    }).onDone(() async {
                      print("listen: " + listenAccounts);
                      //  todo(amirreza)

                    });
                  });
                });
              });
            });
          });
        });
      });
    }
  }
}
