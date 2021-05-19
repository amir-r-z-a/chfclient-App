import 'package:chfclient/Classes/ClientAccounts.dart';
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
            ClientAccounts.accounts[ClientAccounts.currentAccount].getCartListLength(),
            (index) =>
                ClientAccounts.accounts[ClientAccounts.currentAccount].cartList[index]),
      ),
    );
  }
}
