import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';

class IranianFoodsScreen extends StatefulWidget {
  const IranianFoodsScreen({Key key}) : super(key: key);

  @override
  _IranianFoodsScreenState createState() => _IranianFoodsScreenState();
}

class _IranianFoodsScreenState extends State<IranianFoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iranian Foods"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: List.generate(RestaurantAccounts.getRestaurantListLength(),
              (index) {
            if(RestaurantAccounts.restaurantList[0][index].type == RestaurantTypes.IranianRestaurant )
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
