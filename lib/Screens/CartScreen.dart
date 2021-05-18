import 'package:chfclient/Classes/Accounts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getCartListLength(),
            (index) =>
                Accounts.accounts[Accounts.currentAccount].cartList[index]),
      ),
    );
  }
}
