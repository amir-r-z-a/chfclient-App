import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  String _restaurantName;
  String _restaurantAddress;
  Map<int, int> _cartSum;
  Map<int, String> _cartName;
  Map<int, int> _cartNum;
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

  int get j => _j;

  set j(int value) {
    _j = value;
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

  void cartAdd(String foodName, String price) {
    cartSum[-1] += int.parse(price);
    cartNum[-1]++;
    for (int i = 0; i < getCartNameLength(); i++) {
      if (cartName[i] == foodName) {
        cartSum[i] += int.parse(price);
        cartNum[i]++;
        return;
      }
    }
    cartName[getCartNameLength()] = foodName;
    cartSum[getCartSumLength()] = int.parse(price);
    cartNum[getCartNumLength()] = 1;
  }

  void cartMin(String foodName, String price) {
    cartSum[-1] -= int.parse(price);
    cartNum[-1]--;
    for (int i = 0; i < getCartNameLength(); i++) {
      if (cartName[i] == foodName) {
        cartSum[i] -= int.parse(price);
        cartNum[i]--;
      }
    }
  }

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    CartScreen.cartTile=refreshPage;

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
                          Text(widget.cartDate.dateFormatter()),
                          Icon(Icons.watch_later_outlined),
                          Text("12:15")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(widget.restaurantAddress),
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
                Text(widget.cartSum[-1].toString() + "\$"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 18, 50, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DetailsRestaurantTile.j = widget.j;
                    DetailsRestaurantTile.index = 0;
                    ClientFoodTile.cartTile = refreshPage;
                    Navigator.pushNamed(context, '/DetailsRestaurantTile');
                  },
                  child: Text("Continue"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ClientAccounts
                        .accounts[ClientAccounts.currentAccount].cartList
                        .remove(widget.j);
                    for (int i = 0;
                        i <
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .cartList[-1]
                                .length;
                        i++) {
                      if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                              .cartList[-1][i].j ==
                          widget.j) {
                        ClientAccounts.accounts[ClientAccounts.currentAccount]
                            .cartList[-1]
                            .removeAt(i);
                      }
                    }
                    for (int i = 0;
                        i <
                            RestaurantAccounts.restaurantList[0][widget.j]
                                .clientTabBarView[0].length;
                        i++) {
                      RestaurantAccounts.restaurantList[0][widget.j]
                          .clientTabBarView[0][i].counter = 0;
                    }
                    CartTile.cartScreen();

                    //  show alertDialog before delete
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
