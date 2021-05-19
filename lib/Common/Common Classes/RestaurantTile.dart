import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class RestaurantTile extends StatefulWidget {
  String _name;
  String _address;
  Map _tabBarTitle;
  Map _clientTabBarView;
  String email;
  double _point;
  double _workingRadius;

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
    this._restaurantComments, {
    this.email,
  });

  @override
  _RestaurantTileState createState() => _RestaurantTileState();
}

class _RestaurantTileState extends State<RestaurantTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {

    },
      child: Container(
        height: 290,
        width: 260,
        color: Colors.red,
      ),
    );
  }
}
