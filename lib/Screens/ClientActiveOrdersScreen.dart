import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class ClientActiveOrdersScreen extends StatefulWidget {
  void enterPoint (){
  }
  @override
  _ClientActiveOrdersScreenState createState() => _ClientActiveOrdersScreenState();
}

class _ClientActiveOrdersScreenState extends State<ClientActiveOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
            ClientAccounts.accounts[ClientAccounts.currentAccount].getActiveOrdersLength(),
            (index) =>
                ClientAccounts.accounts[ClientAccounts.currentAccount].activeOrders[index]),
      ),
    );
  }
}
