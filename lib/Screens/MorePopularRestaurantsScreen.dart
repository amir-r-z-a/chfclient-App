import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:flutter/material.dart';
class MorePopularRestaurantsScreen extends StatefulWidget {
  const MorePopularRestaurantsScreen({Key key}) : super(key: key);

  @override
  _MorePopularRestaurantsScreenState createState() => _MorePopularRestaurantsScreenState();
}

class _MorePopularRestaurantsScreenState extends State<MorePopularRestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopularRestaurants"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: List.generate(RestaurantAccounts.getRestaurantListLength(),
                  (index) {
                if(RestaurantAccounts.restaurantList[0][index].point > 3 )
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
