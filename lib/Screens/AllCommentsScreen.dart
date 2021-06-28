import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class AllCommentsScreen extends StatefulWidget {
  const AllCommentsScreen({Key key}) : super(key: key);

  @override
  _AllCommentsScreenState createState() => _AllCommentsScreenState();
}

class _AllCommentsScreenState extends State<AllCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
            RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
                .restaurantComments.length,
            (index) => RestaurantAccounts
                .restaurantList[0][DetailsRestaurantTile.j]
                .restaurantComments[index]),
      ),
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
      ),
    );
  }
}
