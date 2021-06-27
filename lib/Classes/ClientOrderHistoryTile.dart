import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/ClientActiveOrderTileScreen.dart';
import 'package:flutter/material.dart';

import 'ClientAccounts.dart';
import 'FinishedClientFoodTile.dart';

class ClientOrderHistoryTile extends StatefulWidget {
  // const ClientOrderHistoryTile({Key key}) : super(key: key);
  String _restaurantName;
  Date _orderDate;
  String _orderAddress;
  String _restaurantAddress;
  Map<int, double> _orderSum;
  Map<int, String> _orderName;
  Map<int, int> _orderNum;
  List<FinishedClientFoodTile> _orderFoods;
  String _id;

  ClientOrderHistoryTile(
      this._restaurantName,
      this._orderDate,
      this._orderAddress,
      this._restaurantAddress,
      this._orderSum,
      this._orderName,
      this._orderNum,
      this._orderFoods,
      );

  Map<int, double> get orderSum => _orderSum;

  set orderSum(Map<int, double> value) {
    _orderSum = value;
  }

  String get restaurantAddress => _restaurantAddress;

  set restaurantAddress(String value) {
    _restaurantAddress = value;
  }

  Map<int, String> get orderName => _orderName;

  set orderName(Map<int, String> value) {
    _orderName = value;
  }

  Map<int, int> get orderNum => _orderNum;

  set orderNum(Map<int, int> value) {
    _orderNum = value;
  }

  String get orderAddress => _orderAddress;

  set orderAddress(String value) {
    _orderAddress = value;
  }

  Date get orderDate => _orderDate;

  set orderDate(Date value) {
    _orderDate = value;
  }

  String get restaurantName => _restaurantName;

  set restaurantName(String value) {
    _restaurantName = value;
  }

  List<FinishedClientFoodTile> get orderFoods => _orderFoods;

  set orderFoods(List<FinishedClientFoodTile> value) {
    _orderFoods = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  _ClientOrderHistoryTileState createState() => _ClientOrderHistoryTileState();
}

class _ClientOrderHistoryTileState extends State<ClientOrderHistoryTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        margin: EdgeInsets.all(12),
        child: Card(
          elevation: 7,
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ClientAccounts.digester(
                                      widget.restaurantName, 20),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  Text(' ' +
                                      widget.orderDate.dateFormatter().substring(
                                          0,
                                          widget.orderDate
                                              .dateFormatter()
                                              .indexOf(','))),
                                  Icon(Icons.watch_later_outlined),
                                  Text(widget.orderDate.dateFormatter().substring(
                                      widget.orderDate
                                          .dateFormatter()
                                          .indexOf(',') +
                                          1)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(ClientAccounts.digester(
                                    widget.orderAddress, 20)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total"),
                    Text("\$" + widget.orderSum[-1].toString()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                          //TODO
                      },
                      child: Text("Re Order"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        // delete gozashte shavad
                        ClientActiveOrderTileScreen.orderFoods = widget._orderFoods;
                        ClientActiveOrderTileScreen.orderName = widget._orderName;
                        ClientActiveOrderTileScreen.orderNum = widget._orderNum;
                        ClientActiveOrderTileScreen.orderSum = widget._orderSum;
                        ClientActiveOrderTileScreen.restaurantAddress =
                            widget._restaurantAddress;
                        ClientActiveOrderTileScreen.orderAddress =
                            widget._orderAddress;
                        ClientActiveOrderTileScreen.orderDate = widget._orderDate;
                        ClientActiveOrderTileScreen.restaurantName =
                            widget._restaurantName;
                        Navigator.pushNamed(context, "/ClientActiveOrderTileScreen");
                      },
                      child: Text("View invoice"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
