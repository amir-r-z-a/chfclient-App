import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:flutter/material.dart';

class OrderRegistrationScreen extends StatefulWidget {
  static int j;
  static List<Function> clientFoods = [];
  static bool flag = false;
  static Function cartScreen;
  static Function detailsRestaurant;

  @override
  _OrderRegistrationScreenState createState() => _OrderRegistrationScreenState();
}

class _OrderRegistrationScreenState extends State<OrderRegistrationScreen> {
  void deleteFunc() {
    CartTile cartTile = CartTile(
        RestaurantAccounts.restaurantList[0][OrderRegistrationScreen.j].name,
        RestaurantAccounts.restaurantList[0][OrderRegistrationScreen.j].address,
        {-1: 0},
        {-1: 'All'},
        {-1: 0},
        Date('2021', '3', '12', '4', '22', '23'),
        OrderRegistrationScreen.j);
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .cartList[OrderRegistrationScreen.j] = cartTile;
    for (int i = 0;
        i <
            ClientAccounts
                .accounts[ClientAccounts.currentAccount].cartList[-1].length;
        i++) {
      if (ClientAccounts
              .accounts[ClientAccounts.currentAccount].cartList[-1][i].j ==
          OrderRegistrationScreen.j) {
        ClientAccounts.accounts[ClientAccounts.currentAccount].cartList[-1][i] =
            cartTile;
      }
    }
    for (int i = 0;
        i <
            RestaurantAccounts.restaurantList[0][OrderRegistrationScreen.j]
                .clientTabBarView[0].length;
        i++) {
      RestaurantAccounts.restaurantList[0][OrderRegistrationScreen.j]
          .clientTabBarView[0][i].counter = 0;
    }
    for (int i = 0; i < OrderRegistrationScreen.clientFoods.length; i++) {
      OrderRegistrationScreen.clientFoods[i]();
    }
    if (OrderRegistrationScreen.cartScreen != null) {
      OrderRegistrationScreen.cartScreen();
    }
    OrderRegistrationScreen.detailsRestaurant();
    Navigator.pop(context);
    Navigator.pop(context);
    if (OrderRegistrationScreen.flag) {
      Navigator.pop(context);
    }
    OrderRegistrationScreen.flag = false;
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
                      .cartList[OrderRegistrationScreen.j].cartName.length -
                  1,
              (index) {
                if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[OrderRegistrationScreen.j].cartNum[index] !=
                    0) {
                  return FinishedClientFoodTile(
                    ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[OrderRegistrationScreen.j].cartName[index],
                    (ClientAccounts.accounts[ClientAccounts.currentAccount]
                                .cartList[OrderRegistrationScreen.j].cartSum[index] /
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .cartList[OrderRegistrationScreen.j]
                                .cartNum[index])
                        .toString(),
                    RestaurantAccounts.restaurantList[0][OrderRegistrationScreen.j]
                        .getCategory(ClientAccounts
                            .accounts[ClientAccounts.currentAccount]
                            .cartList[OrderRegistrationScreen.j]
                            .cartName[index]),
                    desc: RestaurantAccounts.restaurantList[0]
                            [OrderRegistrationScreen.j]
                        .getDesc(ClientAccounts
                            .accounts[ClientAccounts.currentAccount]
                            .cartList[OrderRegistrationScreen.j]
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
