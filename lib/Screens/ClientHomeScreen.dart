import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:flutter/material.dart';

class ClientHomeScreen extends StatefulWidget {
  static Function restaurantTile;

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'All',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(RestaurantAccounts.restaurantList[0].length,
                (index) {
              // if (ClientHomeScreen.restaurantTile != null) {
              //   ClientHomeScreen.restaurantTile();
              // }
              if (RestaurantAccounts.restaurantList[0][index].refreshPage !=
                  null) {
                // RestaurantAccounts.restaurantList[0][index].refreshPage();
              }
              return RestaurantAccounts.restaurantList[0][index];
            }),
          ),
        )
      ],
    );
  }
}
