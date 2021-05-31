import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  String _restaurantName;
  String _restaurantAddress;
  Map<int, double> _cartSum;
  Map<int, String> _cartName;
  Map<int, int> _cartNum;
  List _cartFoods;
  List<int> _listAbsoluteCartIndex = [];
  bool controller = true;
  bool more = true;

  static Function cartScreen;

  // Image _restaurantProfile;
  Date _cartDate;
  int _j;

  CartTile(
      this._restaurantName,
      this._restaurantAddress,
      this._cartSum,
      this._cartName,
      this._cartNum,
      /*this._restaurantProfile,*/
      this._cartDate,
      this._j);

  String get restaurantName => _restaurantName;

  set restaurantName(String value) {
    _restaurantName = value;
  }

  String get restaurantAddress => _restaurantAddress;

  set restaurantAddress(String value) {
    _restaurantAddress = value;
  }

  // Image get restaurantProfile => _restaurantProfile;
  //
  // set restaurantProfile(Image value) {
  //   _restaurantProfile = value;
  // }

  Date get cartDate => _cartDate;

  set cartDate(Date value) {
    _cartDate = value;
  }

  Map get cartSum => _cartSum;

  set cartSum(Map value) {
    _cartSum = value;
  }

  Map get cartName => _cartName;

  set cartName(Map value) {
    _cartName = value;
  }

  Map get cartNum => _cartNum;

  set cartNum(Map value) {
    _cartNum = value;
  }

  List<FinishedClientFoodTile> get cartFoods => _cartFoods;

  set cartFoods(List<FinishedClientFoodTile> value) {
    _cartFoods = value;
  }

  int get j => _j;

  set j(int value) {
    _j = value;
  }

  List<int> get listAbsoluteCartIndex => _listAbsoluteCartIndex;

  set listAbsoluteCartIndex(List<int> value) {
    _listAbsoluteCartIndex = value;
  }

  int getCartNameLength() {
    return cartName.length;
  }

  int getCartNumLength() {
    return cartNum.length;
  }

  int getCartSumLength() {
    return cartSum.length;
  }

  int getListAbsoluteCartLength() {
    return listAbsoluteCartIndex.length;
  }

  bool getListAbsoluteCart() {
    listAbsoluteCartIndex = [];
    for (int i = 0; i < getCartNumLength() - 1; i++) {
      if (cartNum[i] != 0) {
        listAbsoluteCartIndex.add(i);
      }
    }
    controller = getListAbsoluteCartLength() > 3;
    return controller;
  }

  void cartAdd(String foodName, String price) {
    cartSum[-1] += double.parse(price);
    cartNum[-1]++;
    for (int i = 0; i < getCartNameLength(); i++) {
      if (cartName[i] == foodName) {
        cartSum[i] += double.parse(price);
        cartNum[i]++;
        return;
      }
    }
    cartName[getCartNameLength() - 1] = foodName;
    cartSum[getCartSumLength() - 1] = double.parse(price);
    cartNum[getCartNumLength() - 1] = 1;
  }

  void cartMin(String foodName, String price) {
    cartSum[-1] -= double.parse(price);
    cartNum[-1]--;
    for (int i = 0; i < getCartNameLength(); i++) {
      if (cartName[i] == foodName) {
        cartSum[i] -= double.parse(price);
        cartNum[i]--;
      }
    }
  }

  int getCartFoodsLength() {
    return cartFoods.length;
  }

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {
        widget.more = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CartScreen.cartTile = refreshPage;

    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 220,
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
                                Text('  ' +
                                    widget.cartDate.dateFormatter().substring(
                                        0,
                                        widget.cartDate
                                            .dateFormatter()
                                            .indexOf(','))),
                                Icon(Icons.watch_later_outlined),
                                Text(' ' +
                                    widget.cartDate.dateFormatter().substring(
                                        widget.cartDate
                                                .dateFormatter()
                                                .indexOf(',') +
                                            1))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(' ' +
                                  ClientAccounts.digester(
                                      widget.restaurantAddress, 20)),
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
              margin: EdgeInsets.all(17),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                      widget.getListAbsoluteCart() && widget.more
                          ? 3
                          : widget.getListAbsoluteCartLength(),
                      (index) {
                        if (widget
                                .cartNum[widget.listAbsoluteCartIndex[index]] !=
                            0) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.cartName[
                                        widget.listAbsoluteCartIndex[index]] +
                                    ' (' +
                                    widget.cartNum[
                                            widget.listAbsoluteCartIndex[index]]
                                        .toString() +
                                    ')'),
                                Text('\$' +
                                    (widget.cartSum[widget
                                                .listAbsoluteCartIndex[index]] /
                                            widget.cartNum[widget
                                                .listAbsoluteCartIndex[index]])
                                        .toString())
                              ],
                            ),
                          );
                        }
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      },
                    ),
                  ),
                  widget.getListAbsoluteCart()
                      ? Padding(
                          padding: const EdgeInsets.only(left: 150.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.more = !widget.more;
                              });
                            },
                            child: Row(
                              children: [
                                Text(widget.more ? 'more' : 'fewer'),
                                Icon(widget.more
                                    ? Icons.keyboard_arrow_down_outlined
                                    : Icons.keyboard_arrow_up_outlined),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                          width: 0,
                        ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17, 18, 12, 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total"),
                  Text("\$" + widget.cartSum[-1].toString()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 175,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        DetailsRestaurantTile.j = widget.j;
                        DetailsRestaurantTile.index = 0;
                        ClientFoodTile.cartTile = refreshPage;
                        Navigator.pushNamed(context, '/DetailsRestaurantTile');
                      },
                      child: Text("Continue"),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        ClientAccounts.accounts[
                                ClientAccounts.currentAccount] /*.cartList*/
                            .removeCart(widget.j);
                        CartTile.cartScreen();
                        //  show alertDialog before delete
                      },
                      child: Text("Delete"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
