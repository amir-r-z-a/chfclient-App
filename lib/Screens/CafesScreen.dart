import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class CafesScreen extends StatefulWidget {
  const CafesScreen({Key key}) : super(key: key);

  @override
  _CafesScreenState createState() => _CafesScreenState();
}

class _CafesScreenState extends State<CafesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: List.generate(RestaurantAccounts.getRestaurantListLength(),
              (index) {
            if (RestaurantAccounts.restaurantList[0][index].type ==
                RestaurantTypes.Cafe) {
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
