import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class RestaurantTile extends StatefulWidget {
  String _name;
  String _address;
  Map _tabBarTitle;
  Map _clientTabBarView;
  String email;
  double _point;
  double _workingRadius;

  // List<CartTile> _cart;
  int _j;

  // Image _profileImage;
  RestaurantTypes _type;
  Map _restaurantComments;

  RestaurantTile(
    this._name,
    this._address,
    this._tabBarTitle,
    this._clientTabBarView,
    this._point,
    this._workingRadius,
    // this._profileImage,
    this._type,
    this._restaurantComments,
    this._j, {
    this.email,
  });

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
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

  // List<CartTile> get cart => _cart;
  //
  // set cart(List<CartTile> value) {
  //   _cart = value;
  // }

  int get j => _j;

  set j(int value) {
    _j = value;
  }

  @override
  _RestaurantTileState createState() => _RestaurantTileState();
}

class _RestaurantTileState extends State<RestaurantTile> {
  @override
  Widget build(BuildContext context) {
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
            Date('2021', '3', '12', '4', '22', '23'),
            widget.j));
        Navigator.pushNamed(context, '/DetailsRestaurantTile');
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 290,
        width: 260,
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 240,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Text(widget.name)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(widget.type
                      .toString()
                      .substring(widget.type.toString().indexOf('.') + 1))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(child: Text('post' + "\$")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
