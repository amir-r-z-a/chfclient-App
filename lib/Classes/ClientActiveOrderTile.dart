import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:flutter/material.dart';

class ClientActiveOrderTile extends StatefulWidget {
  // const ClientActiveOrderTile({Key key}) : super(key: key);
  String _restaurantName;
  Date _orderDate;
  String _orderAddress;
  String _restaurantAddress;
  Map<int, double> _orderSum;
  Map<int, String> _orderName;
  Map<int, int> _orderNum;
  List<FinishedClientFoodTile> _orderFoods;

  ClientActiveOrderTile(
      this._restaurantName,
      this._orderDate,
      this._orderAddress,
      this._restaurantAddress,
      this._orderSum,
      this._orderName,
      this._orderNum,
      this._orderFoods);

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

  @override
  _ClientActiveOrderTileState createState() => _ClientActiveOrderTileState();
}

class _ClientActiveOrderTileState extends State<ClientActiveOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all()),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.restaurantName,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          Text(widget.orderDate.dateFormatter()),
                          Icon(Icons.watch_later_outlined),
                          Text("12:15")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(widget.orderAddress),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sum of Prices"),
                Text("\$" + widget.orderSum[-1].toString()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
            child: ElevatedButton(
              onPressed: () {
                //TODO
              },
              child: Text("View invoice"),
            ),
          ),
        ],
      ),
    );
  }
}
