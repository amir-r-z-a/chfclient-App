import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';
class OthersScreen extends StatefulWidget {
  const OthersScreen({Key key}) : super(key: key);
  @override
  _OthersScreenState createState() => _OthersScreenState();
}
class _OthersScreenState extends State<OthersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Others"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: List.generate(RestaurantAccounts.getRestaurantListLength(),
                  (index) {
                if (RestaurantAccounts.restaurantList[0][index].type ==
                    RestaurantTypes.Other) {
                  return RestaurantAccounts.restaurantList[0][index];
                }
                return Container(
                  height: 0,
                  width: 0,
                );
              }),
        ),
      ),
    );
  }
}
