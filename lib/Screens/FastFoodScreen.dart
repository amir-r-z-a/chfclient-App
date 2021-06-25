import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class FastFoodScreen extends StatefulWidget {
  const FastFoodScreen({Key key}) : super(key: key);

  @override
  _FastFoodScreenState createState() => _FastFoodScreenState();
}

class _FastFoodScreenState extends State<FastFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fast Foods"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: List.generate(RestaurantAccounts.getRestaurantListLength(),
                  (index) {
                if(RestaurantAccounts.restaurantList[0][index].type == RestaurantTypes.FastFood )
                {
                  return RestaurantAccounts.restaurantList[0][index];
                }
                return Container(height: 0,width: 0,);
              }),
        ),
      ),
    );
  }
}

