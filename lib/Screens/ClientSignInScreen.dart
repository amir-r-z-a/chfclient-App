import 'dart:io';

import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/Food.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
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
      List<String> strings = ans.split(', ');
      print("strings is:" + strings.toString());
      ClientAccounts.accounts = [];
      Client client =
          Client(strings[1], ans.substring(0, ans.indexOf(':')), strings[2]);
      ClientAccounts.key = true;
      if (strings[3] != 'null') {
        client.email = strings[3];
      }
      if (strings[4] != 'null') {
        client.address[client.currentAddress].address = strings[4];
      }
      print("locatio: " + strings[5]);
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
              List<String> addresses = listenAddresses.split('\n');
              for (int i = 0; i < addresses.length; i++) {
                if (addresses[i].startsWith(MyApp.id)) {
                  String m = addresses[i];
                  List z = m.split(", ");
                  String add = z[1];
                  String latitude = z[2]
                      .substring(z[2].indexOf(':') + 1, z[2].indexOf(':::'));
                  String longitude = z[2]
                      .substring(z[2].lastIndexOf(':') + 1, z[2].indexOf(')'));
                  LatLng latLng =
                      LatLng(double.parse(latitude), double.parse(longitude));
                  client.addAddress(add, latLng);
                }
              }
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
                      List<String> mainSplit = listenAccounts.split('***');
                      List<String> x = mainSplit[0].split("\n");
                      int counter = x.length;
                      print('counter is: ' + counter.toString());
                      RestaurantAccounts.restaurantList[0] = [];
                      for (int i = 0; i < counter - 1; i++) {
                        RestaurantTypes m;
                        List<String> y = x[i].split(", ");
                        if (y[5] == "Other") {
                          m = RestaurantTypes.Other;
                        } else if (y[5] == "IranianRestaurant") {
                          m = RestaurantTypes.IranianRestaurant;
                        } else if (y[5] == "Cafe") {
                          m = RestaurantTypes.Cafe;
                        } else if (y[5] == "FastFood") {
                          m = RestaurantTypes.FastFood;
                        }

                        // String latitude = strings[5]
                        //     .substring(strings[5].indexOf(':') + 1, strings[5].indexOf(':::'));
                        // String longitude = strings[5].substring(
                        //     strings[5].lastIndexOf(':') + 1, strings[5].indexOf(')'));
                        // LatLng latLng = LatLng(double.parse(latitude), double.parse(longitude));

                        String lalo = y[8];
                        double la = double.parse(lalo.substring(
                            lalo.indexOf(':') + 1, lalo.indexOf(':::')));
                        double lo = double.parse(lalo.substring(
                            lalo.lastIndexOf(':') + 1, lalo.indexOf(')')));
                        LatLng Loacation = LatLng(la, lo);
                        RestaurantTile restaurant = RestaurantTile(
                            y[1],
                            y[7],
                            x[i].substring(0, 11),
                            double.parse(y[10]),
                            double.parse(y[9]),
                            m,
                            Loacation,
                            int.parse(y[11]),
                            y[6],
                            y[3],
                            y[4]);
                        print("restaurant is: " + restaurant.toStringShort());
                        print("restaurant name is: " + restaurant.name);
                        print("restaurant address is: " + restaurant.address);
                        print("restaurant phoneNumber is: " +
                            restaurant.phoneNumber);
                        print("restaurant point is: " +
                            restaurant.point.toString());
                        print("restaurant radius is: " +
                            restaurant.workingRadius.toString());
                        print("restaurant type is: " +
                            restaurant.type.toString());
                        print("restaurant location is: " +
                            restaurant.location.toString());
                        print("restaurant j is: " + restaurant.j.toString());
                        print("restaurant email is: " + restaurant.email);
                        //  todo(amirreza)
                        List<String> allCategory = mainSplit[1].split('\n');
                        String phoneNumber = x[i].substring(0, 11);
                        List<String> titles = ['All'];
                        for (int j = 0; j < allCategory.length; j++) {
                          if (allCategory[j].startsWith(phoneNumber)) {
                            List<String> categoryElements =
                                allCategory[j].split(', ');
                            print("allCategory[j] is: " + allCategory[j]);
                            for (int k = 1;
                                k < categoryElements.length - 1;
                                k++) {
                              print("categoryElements[k] is: " +
                                  categoryElements[k]);
                              print("restaurant is11: " +
                                  restaurant.toStringShort());
                              print("restaurant name is11: " + restaurant.name);
                              if (categoryElements[k] != 'All') {
                                restaurant.addTabBarTitle(categoryElements[k]);
                                titles.add(categoryElements[k]);
                              }
                            }
                            break;
                          }
                        }
                        List<String> allMenu = mainSplit[2].split('\n');
                        for (int j = 0; j < allMenu.length; j++) {
                          if (allMenu[j].startsWith(phoneNumber)) {
                            List<String> foodElements = allMenu[j].split(', ');
                            if (foodElements[0].split(':')[1] != 'All') {
                              int index;
                              for (int u = 0; u < titles.length; u++) {
                                if (titles[u] ==
                                    foodElements[0].split(':')[1]) {
                                  index = u;
                                }
                              }
                              restaurant.addTabBarViewElements(
                                  ClientFoodTile(
                                    foodElements[0].split(':')[2],
                                    foodElements[2],
                                    foodElements[3] == 'true',
                                    foodElements[0].split(':')[1],
                                    desc: (foodElements[1] == 'null'
                                        ? ''
                                        : foodElements[1]),
                                  ),
                                  index);
                            }
                          }
                        }
                        List<String> faves = listenFav.split(', ');
                        for (int j = 0; j < faves.length; j++) {
                          if (restaurant.phoneNumber ==
                              faves[j].split(':::')[0]) {
                            client.favRestaurants.add(restaurant);
                          }
                        }
                        RestaurantAccounts.receiveRestaurant(restaurant);
                      }
                      ClientAccounts.addAccount(client);
                      print("Welcome to Chamir food");
                      print('A: ' + ClientAccounts.accounts.toString());
                      print('CA: ' + ClientAccounts.currentAccount.toString());
                      Navigator.pushNamed(context, '/ClientMainMenuScreen');
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
