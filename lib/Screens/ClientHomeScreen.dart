import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:flutter/material.dart';

class ClientHomeScreen extends StatefulWidget {
  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
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
                (index) => RestaurantAccounts.restaurantList[0][index]),
          ),
        )
      ],
    );
  }
}
