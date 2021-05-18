import 'package:chfclient/Classes/Accounts.dart';
import 'package:flutter/material.dart';

class ClientActiveOrdersScreen extends StatefulWidget {
  @override
  _ClientActiveOrdersScreenState createState() => _ClientActiveOrdersScreenState();
}

class _ClientActiveOrdersScreenState extends State<ClientActiveOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
            Accounts.accounts[Accounts.currentAccount].getActiveOrdersLength(),
            (index) =>
                Accounts.accounts[Accounts.currentAccount].activeOrders[index]),
      ),
    );
  }
}
