import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/material.dart';

class DetailsClientFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static Function addCartFunc;

  @override
  _DetailsClientFoodTileState createState() => _DetailsClientFoodTileState();
}

class _DetailsClientFoodTileState extends State<DetailsClientFoodTile> {
  var key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            // Padding(padding: EdgeInsets.all(5)),
            Text(
              DetailsClientFoodTile.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(DetailsClientFoodTile.desc),
            Padding(padding: EdgeInsets.all(3)),
            Text('Price: ' + '\$' + DetailsClientFoodTile.price.toString()),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    DetailsClientFoodTile.addCartFunc();
                  },
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
                Row(
                  children: [
                    Text(
                      DetailsClientFoodTile.foodStatus ? 'Active' : 'Inactive',
                      style: TextStyle(
                          color: DetailsClientFoodTile.foodStatus
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
