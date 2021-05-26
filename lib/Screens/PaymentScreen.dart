import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/ClientMainMenuScreen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static int j;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  void notEnoughWallet() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Wallet is not enough'),
        content: Container(
          height: 120,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child:
                        Text('Your Wallet is not enough do you like add it?'),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/WalletScreen'),
                    child: Text(
                      'Add Wallet',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void enoughWallet() {
    List<FinishedClientFoodTile> orderFoods = List<FinishedClientFoodTile>();
    for (int i = 0;
        i <
            ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[PaymentScreen.j]
                .getCartFoodsLength();
        i++) {
      orderFoods.add(ClientAccounts.accounts[ClientAccounts.currentAccount]
          .cartList[PaymentScreen.j].cartFoods[i]);
    }
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .addOrder(ClientActiveOrderTile(
      RestaurantAccounts.restaurantList[0][PaymentScreen.j].name,
      Date('2021', '3', '12', '4', '22', '23'),
      ClientAccounts
          .accounts[ClientAccounts.currentAccount]
          .address[ClientAccounts
              .accounts[ClientAccounts.currentAccount].currentAddress]
          .address,
      RestaurantAccounts.restaurantList[0][PaymentScreen.j].address,
      ClientAccounts.accounts[ClientAccounts.currentAccount]
          .cartList[PaymentScreen.j].cartSum,
      ClientAccounts.accounts[ClientAccounts.currentAccount]
          .cartList[PaymentScreen.j].cartName,
      ClientAccounts.accounts[ClientAccounts.currentAccount]
          .cartList[PaymentScreen.j].cartNum,
      orderFoods,
    ));
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .removeCart(PaymentScreen.j);
    ClientMainMenuScreen.activeOrder = true;
    Navigator.popUntil(context, ModalRoute.withName('/ClientMainMenuScreen'));
    Navigator.pushNamed(context, '/ClientMainMenuScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () => ClientAccounts
                      .accounts[ClientAccounts.currentAccount]
                      .validPayment(ClientAccounts
                          .accounts[ClientAccounts.currentAccount]
                          .cartList[PaymentScreen.j]
                          .cartSum[-1])
                  ? enoughWallet()
                  : notEnoughWallet(),
              child: Text('Payment'),
            ),
            Text(
              '\$' +
                  ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .cartList[PaymentScreen.j].cartSum[-1]
                      .toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Payment Screen'),
      ),
      body: ListView(
        children: [
          Column(
            children: List.generate(
                ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .getAddressLength(),
                (index) => ClientAccounts
                    .accounts[ClientAccounts.currentAccount].address[index]),
          )
        ],
      ),
    );
  }
}
