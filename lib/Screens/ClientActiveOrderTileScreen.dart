import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:flutter/material.dart';
class ClientActiveOrderTileScreen extends StatefulWidget {
  static String restaurantName;
  static Date orderDate;
  static String orderAddress;
  static  String restaurantAddress;
  static Map<int, double> orderSum;
  static Map<int, String> orderName;
  static Map<int, int> orderNum;
  static List<FinishedClientFoodTile> orderFoods;

  @override
  _ClientActiveOrderTileScreenState createState() => _ClientActiveOrderTileScreenState();
}

class _ClientActiveOrderTileScreenState extends State<ClientActiveOrderTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("invoice"),
      ),
      body: Container(
        child: ListView(
          children:
            List.generate(ClientActiveOrderTileScreen.orderFoods.length, (index) {if (ClientActiveOrderTileScreen.orderFoods[index].counter>0){
              return  ClientActiveOrderTileScreen.orderFoods[index] ;
        }
            else return Container(height: 0,width: 0,);})
        ),
      ),
    );
  }
}
