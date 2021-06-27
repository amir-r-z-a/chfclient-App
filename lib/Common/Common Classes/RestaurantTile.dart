import 'dart:io';

import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/Food.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfclient/Screens/ClientHomeScreen.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/main.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

class RestaurantTile extends StatefulWidget {
  String _name;
  String _address;
  String _phoneNumber;
  Map _tabBarTitle = {0: 'All'};
  Map _clientTabBarView = {0: []};
  String _email;
  double _point;
  double _workingRadius;
  LatLng _location;
  Function refreshPage;
  String _startingTime;
  String _endingTime;

  // List<CartTile> _cart;
  int _j;

  // Image _profileImage;
  RestaurantTypes _type;
  Map _restaurantComments = {};
  List<Widget> stars = [
    Container(child: Icon(Icons.star)),
    Container(child: Icon(Icons.star)),
    Container(child: Icon(Icons.star)),
    Container(child: Icon(Icons.star)),
    Container(child: Icon(Icons.star)),
  ];

  // static Function homeScreen;
  RestaurantTile(
      this._name,
      this._address,
      this._phoneNumber,
      // this._tabBarTitle,
      // this._clientTabBarView,
      this._point,
      this._workingRadius,
      // this._profileImage,
      this._type,
      // this._restaurantComments,
      this._location,
      this._j,
      this._email,
      this._startingTime,
      this._endingTime);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  Map get tabBarTitle => _tabBarTitle;

  set tabBarTitle(Map value) {
    _tabBarTitle = value;
  }

  Map get clientTabBarView => _clientTabBarView;

  set clientTabBarView(Map value) {
    _clientTabBarView = value;
  }

  double get point => _point;

  set point(double value) {
    _point = value;
  }

  double get workingRadius => _workingRadius;

  set workingRadius(double value) {
    _workingRadius = value;
  }

  RestaurantTypes get type => _type;

  set type(RestaurantTypes value) {
    _type = value;
  }

  Map get restaurantComments => _restaurantComments;

  set restaurantComments(Map value) {
    _restaurantComments = value;
  }

  LatLng get location => _location;

  set location(LatLng value) {
    _location = value;
  } // List<CartTile> get cart => _cart;
  //
  // set cart(List<CartTile> value) {
  //   _cart = value;
  // }

  int get j => _j;

  set j(int value) {
    _j = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get startingTime => _startingTime;

  set startingTime(String value) {
    _startingTime = value;
  }

  String get endingTime => _endingTime;

  set endingTime(String value) {
    _endingTime = value;
  }

  int getClientTabBarViewLength() {
    return clientTabBarView.length;
  }

  String getCategory(String input) {
    for (int i = 0; i < getClientTabBarViewLength(); i++) {
      for (int j = 0; j < clientTabBarView[i].length; j++) {
        if (clientTabBarView[i][j].name == input) {
          return clientTabBarView[i][j].category;
        }
      }
    }
    return '-1';
  }

  String getDesc(String input) {
    for (int i = 0; i < getClientTabBarViewLength(); i++) {
      for (int j = 0; j < clientTabBarView[i].length; j++) {
        if (clientTabBarView[i][j].name == input) {
          return clientTabBarView[i][j].desc;
        }
      }
    }
    return '-1';
  }

  int getTabBarTitleLength() {
    return tabBarTitle.length;
  }

  void addTabBarTitle(
      String title /*, ClientFoodTile food,
      {bool addFood = true}*/
      ) {
    int len = getTabBarTitleLength();
    print('im here in tabBarTitle');
    print('len is: ' + len.toString());
    tabBarTitle[len] = title;
    print('im here');
    clientTabBarView[len] = [];
    print('im here');
    restaurantComments[len] = [];
    // if (addFood) {
    //   addTabBarViewElements(food, len);
    // }
  }

  void addTabBarViewElements(ClientFoodTile food, int i) {
    clientTabBarView[0].add(food);
    clientTabBarView[i].add(food);
  }

  @override
  _RestaurantTileState createState() => _RestaurantTileState();
}

class _RestaurantTileState extends State<RestaurantTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.refreshPage = refreshPage;
    // ClientHomeScreen.restaurantTile = refreshPage;
    return GestureDetector(
      onTap: () {
        DetailsRestaurantTile.j = widget.j;
        DetailsRestaurantTile.index = 0;
        ClientAccounts.accounts[ClientAccounts.currentAccount].addCart(CartTile(
            widget.name,
            widget.address,
            {-1: 0},
            {-1: 'All'},
            {-1: 0},
            Date(/*'2021', '3', '12', '4', '22', '23'*/),
            widget.j));
        Navigator.pushNamed(context, '/DetailsRestaurantTile');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 290,
            width: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: 240,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 3)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        ClientAccounts.digester(widget.name, 30),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          widget.type.toString().substring(
                              widget.type.toString().indexOf('.') + 1),
                          style: TextStyle(color: Color(0xff7C2C43)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          children:
                              List.generate(widget.point.toInt(), (index) {
                        return Container(
                            child: Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                        ));
                      })),
                      GestureDetector(
                        onTap: () async {
                          print("log is: " +
                              ClientAccounts
                                  .accounts[ClientAccounts.currentAccount]
                                  .favRestaurants
                                  .length
                                  .toString());

                          print("log: " +
                              ClientAccounts
                                  .accounts[ClientAccounts.currentAccount]
                                  .favRestaurantsKey[widget.j].toString());

                          setState(() {
                            ClientAccounts
                                    .accounts[ClientAccounts.currentAccount]
                                    .favRestaurantsKey[widget.j] =
                                !ClientAccounts
                                    .accounts[ClientAccounts.currentAccount]
                                    .favRestaurantsKey[widget.j];
                            if (ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .favRestaurantsKey[widget.j]) {
                              ClientAccounts
                                  .accounts[ClientAccounts.currentAccount]
                                  .favRestaurants
                                  .add(RestaurantAccounts.restaurantList[0]
                                      [widget.j]);
                            } else {
                              ClientAccounts
                                  .accounts[ClientAccounts.currentAccount]
                                  .favRestaurants
                                  .remove(RestaurantAccounts.restaurantList[0]
                                      [widget.j]);
                            }
                          });
                          String favRestaurants = ' {, ';
                          for (int i = 0;
                              i <
                                  ClientAccounts
                                      .accounts[ClientAccounts.currentAccount]
                                      .favRestaurants
                                      .length;
                              i++) {
                            favRestaurants += ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .favRestaurants[i]
                                .phoneNumber;
                            favRestaurants += ':::';
                            favRestaurants += ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .favRestaurants[i]
                                .name;
                            favRestaurants += ', ';
                          }
                          favRestaurants += '}';
                          String listen = '';
                          await Socket.connect(MyApp.ip, 2442)
                              .then((serverSocket) {
                            print('connected writer');
                            String write = 'ClientFavRestaurants-' +
                                MyApp.id +
                                '-' +
                                favRestaurants;
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
                            });
                            // serverSocket.close();
                          });
                          // ClientAccounts.accounts[ClientAccounts.currentAccount]
                          //     .refreshAllRestaurantTile();
                        },
                        child: ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .favRestaurantsKey[widget.j]
                            ? Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
