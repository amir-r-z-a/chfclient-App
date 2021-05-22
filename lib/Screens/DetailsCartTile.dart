import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class DetailsCartTile extends StatefulWidget {
  static int j;
  static List<Function> clientFoods = [];
  static bool flag = false;
  static Function cartScreen;
  static Function detailsRestaurant;

  @override
  _DetailsCartTileState createState() => _DetailsCartTileState();
}

class _DetailsCartTileState extends State<DetailsCartTile> {
  void deleteFunc() {
    CartTile cartTile = CartTile(
        RestaurantAccounts.restaurantList[0][DetailsCartTile.j].name,
        RestaurantAccounts.restaurantList[0][DetailsCartTile.j].address,
        {-1: 0},
        {-1: 'All'},
        {-1: 0},
        Date('2021', '3', '12', '4', '22', '23'),
        DetailsCartTile.j);
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .cartList[DetailsCartTile.j] = cartTile;
    for (int i = 0;
        i <
            ClientAccounts
                .accounts[ClientAccounts.currentAccount].cartList[-1].length;
        i++) {
      if (ClientAccounts
              .accounts[ClientAccounts.currentAccount].cartList[-1][i].j ==
          DetailsCartTile.j) {
        ClientAccounts.accounts[ClientAccounts.currentAccount].cartList[-1][i] =
            cartTile;
      }
    }
    for (int i = 0;
        i <
            RestaurantAccounts.restaurantList[0][DetailsCartTile.j]
                .clientTabBarView[0].length;
        i++) {
      RestaurantAccounts.restaurantList[0][DetailsCartTile.j]
          .clientTabBarView[0][i].counter = 0;
    }
    for (int i = 0; i < DetailsCartTile.clientFoods.length; i++) {
      DetailsCartTile.clientFoods[i]();
    }
    if (DetailsCartTile.cartScreen != null) {
      DetailsCartTile.cartScreen();
    }
    DetailsCartTile.detailsRestaurant();
    Navigator.pop(context);
    Navigator.pop(context);
    if (DetailsCartTile.flag) {
      Navigator.pop(context);
    }
    DetailsCartTile.flag = false;
  }

  void deleteCart() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Cart'),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(1)),
                    Expanded(child: Text('Are you sure to delete this cart?')),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => deleteFunc(),
                        child: Text(
                          'Delete',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.00),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {},
            child: Text('Continue')),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Registration'),
        actions: [
          GestureDetector(onTap: () => deleteCart(), child: Icon(Icons.delete))
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: List.generate(
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .cartList[DetailsCartTile.j].cartName.length -
                  1,
              (index) {
                if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[DetailsCartTile.j].cartNum[index] !=
                    0) {
                  return FinishedClientFoodTile(
                    ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[DetailsCartTile.j].cartName[index],
                    (ClientAccounts.accounts[ClientAccounts.currentAccount]
                                .cartList[DetailsCartTile.j].cartSum[index] /
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .cartList[DetailsCartTile.j]
                                .cartNum[index])
                        .toString(),
                    RestaurantAccounts.restaurantList[0][DetailsCartTile.j]
                        .getCategory(ClientAccounts
                            .accounts[ClientAccounts.currentAccount]
                            .cartList[DetailsCartTile.j]
                            .cartName[index]),
                    desc: RestaurantAccounts.restaurantList[0]
                            [DetailsCartTile.j]
                        .getDesc(ClientAccounts
                            .accounts[ClientAccounts.currentAccount]
                            .cartList[DetailsCartTile.j]
                            .cartName[index]),
                  );
                }
                return Container(
                  height: 0,
                  width: 0,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
