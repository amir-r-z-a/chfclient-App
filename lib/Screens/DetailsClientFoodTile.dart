import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Screens/DetailsCartTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsClientFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static int counter;
  static Widget myContainer;
  static Widget myRow;
  static Function counterCalculator;
  static Function goToCartScreen;

  @override
  _DetailsClientFoodTileState createState() => _DetailsClientFoodTileState();
}

class _DetailsClientFoodTileState extends State<DetailsClientFoodTile> {
  var key1 = GlobalKey<FormState>();

  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ClientFoodTile.detailsAddMinCart = refreshPage;
    return Scaffold(
      bottomNavigationBar: DetailsClientFoodTile.counterCalculator() > 0
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () => DetailsClientFoodTile.goToCartScreen(),
                child: Text('Finished (' +
                    DetailsClientFoodTile.counterCalculator().toString() +
                    ')'),
              ),
            )
          : null,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              DetailsCartTile.flag = false;
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
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
            Padding(padding: EdgeInsets.all(7)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(2)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DetailsClientFoodTile.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text(DetailsClientFoodTile.desc),
                    Padding(padding: EdgeInsets.all(3)),
                    Text('Price: ' +
                        '\$' +
                        DetailsClientFoodTile.price.toString()),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(2)),
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
                Row(
                  children: [
                    DetailsClientFoodTile.counter == 0
                        ? DetailsClientFoodTile.myContainer
                        : DetailsClientFoodTile.myRow,
                    Padding(padding: EdgeInsets.all(2)),
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

//Container(
//                         height: 25,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                           border: Border.all(width: 0.7, color: Colors.black),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Add',
//                             style: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
