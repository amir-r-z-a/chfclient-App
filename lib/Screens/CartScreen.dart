import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static Function cartTile;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    CartTile.cartScreen = refreshPage;
    ClientFoodTile.cartScreen = refreshPage;
    return Scaffold(
      body: ListView(
        children: List.generate(
            ClientAccounts.accounts[ClientAccounts.currentAccount].cartList[-1]
                .length, (index) {
          int len = ClientAccounts
              .accounts[ClientAccounts.currentAccount].cartList[-1].length;
          if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .cartList[-1][len - index - 1].cartNum[-1] !=
              0) {
            if (CartScreen.cartTile != null) {
              CartScreen.cartTile();
            }
            return ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[-1][len - index - 1];
          }
          return Container(
            height: 0,
            width: 0,
          );
        }),
      ),
    );
  }
}
