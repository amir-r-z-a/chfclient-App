import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedClientFoodTile extends StatefulWidget {
  String _name;
  String _category;
  String _price;
  String desc;

  // bool _foodStatus;
  Image _foodImage;
  int counter = 0;

  // static Function detailsAddMinCart;
  // static Function detailsRestaurant;
  // static Function cartTile;
  // static Function cartScreen;

  FinishedClientFoodTile(
    this._name,
    this._price,
    // this._foodStatus,
    this._category, {
    this.desc,
  });

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  // bool get foodStatus => _foodStatus;
  //
  // set foodStatus(bool value) {
  //   _foodStatus = value;
  // }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  Image get foodImage => _foodImage;

  set foodImage(Image value) {
    _foodImage = value;
  }

  @override
  _FinishedClientFoodTileState createState() => _FinishedClientFoodTileState();
}

class _FinishedClientFoodTileState extends State<FinishedClientFoodTile> {
  // void refreshPage() {
  //   setState(() {
  //     widget.name = DetailsRestaurantFoodTile.name;
  //     widget.desc = DetailsRestaurantFoodTile.desc;
  //     widget.price = DetailsRestaurantFoodTile.price;
  //     widget.foodStatus = DetailsRestaurantFoodTile.foodStatus;
  //   });
  // }

  // void addMinCartFunc(String status) {
  //   setState(() {
  //     if (status == '+') {
  //       widget.counter++;
  //       ClientAccounts.accounts[ClientAccounts.currentAccount]
  //           .cartList[DetailsRestaurantTile.j]
  //           .cartAdd(widget.name, widget.price);
  //     } else {
  //       widget.counter--;
  //       ClientAccounts.accounts[ClientAccounts.currentAccount]
  //           .cartList[DetailsRestaurantTile.j]
  //           .cartMin(widget.name, widget.price);
  //     }
  //     if (FinishedClientFoodTile.detailsAddMinCart != null) {
  //       DetailsClientFoodTile.counter = widget.counter;
  //       DetailsClientFoodTile.myContainer = myContainer();
  //       DetailsClientFoodTile.myRow = myRow();
  //       FinishedClientFoodTile.detailsAddMinCart();
  //     }
  //     FinishedClientFoodTile.detailsRestaurant();
  //     if (FinishedClientFoodTile.cartTile != null) {
  //       FinishedClientFoodTile.cartTile();
  //     }
  //     if (FinishedClientFoodTile.cartScreen != null) {
  //       FinishedClientFoodTile.cartScreen();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Color(0xffDCDCDC), width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(7)),
                    Text(
                      widget.category,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Row(children: [
                  Padding(padding: EdgeInsets.all(7)),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)),
                    height: 95,
                    width: 95,
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ClientAccounts.digester(widget.name,
                          MediaQuery.of(context).size.width.floor() - 372)),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(ClientAccounts.digester(
                          widget.desc == null ? ' ' : widget.desc,
                          MediaQuery.of(context).size.width.floor() - 372)),
                      Padding(padding: EdgeInsets.all(13)),
                      Text(ClientAccounts.digester(
                          'Price: ' + '\$' + widget.price.toString(),
                          MediaQuery.of(context).size.width.floor() - 372)),
                    ],
                  ),
                ]),
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
          ],
        ),
        // color: Colors.green,
        height: 160,
        width: MediaQuery.of(context).size.width,
    );
  }
}
