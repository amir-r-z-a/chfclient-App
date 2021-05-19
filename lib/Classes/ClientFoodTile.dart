import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class ClientFoodTile extends StatefulWidget {
  String _name;
  String _category;
  String _price;
  String desc;
  bool _foodStatus;
  Image _foodImage;
  static Function function;
  static Function topTenFoods;

  ClientFoodTile(
    this._name,
    this._price,
    this._foodStatus,
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

  bool get foodStatus => _foodStatus;

  set foodStatus(bool value) {
    _foodStatus = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  Image get foodImage => _foodImage;

  set foodImage(Image value) {
    _foodImage = value;
  }

  @override
  _ClientFoodTileState createState() => _ClientFoodTileState();
}

class _ClientFoodTileState extends State<ClientFoodTile> {
  // void refreshPage() {
  //   setState(() {
  //     widget.name = DetailsRestaurantFoodTile.name;
  //     widget.desc = DetailsRestaurantFoodTile.desc;
  //     widget.price = DetailsRestaurantFoodTile.price;
  //     widget.foodStatus = DetailsRestaurantFoodTile.foodStatus;
  //   });
  // }

  void addCartFunc() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DetailsRestaurantFoodTile.deleteFunction = deleteFunc;
        // DetailsRestaurantFoodTile.name = widget.name;
        // DetailsRestaurantFoodTile.desc =
        //     widget.desc != null ? widget.desc : ' ';
        // DetailsRestaurantFoodTile.price = widget.price;
        // DetailsRestaurantFoodTile.foodStatus = widget.foodStatus;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsRestaurantFoodTile(
        //       function: refreshPage,
        //     ),
        //   ),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Color(0xffDCDCDC), width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            Row(children: [
              Padding(padding: EdgeInsets.all(7)),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      widget.foodStatus ? 'Active' : 'Inactive',
                      style: TextStyle(
                          color: widget.foodStatus ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => addCartFunc(),
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(width: 0.7, color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                  ],
                ),
              ],
            ),
          ],
        ),
        // color: Colors.green,
        height: 190,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
