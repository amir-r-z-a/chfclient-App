import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
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

  @override
  Widget build(BuildContext context) {
    ClientAddressTile.paymentScreen = refreshPage;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () {
                if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .validPayment(ClientAccounts
                        .accounts[ClientAccounts.currentAccount]
                        .cartList[PaymentScreen.j]
                        .cartSum[-1])) {
                  List<FinishedClientFoodTile> orderFoods =
                      List<FinishedClientFoodTile>();
                  for (int i = 0;
                      i <
                          ClientAccounts.accounts[ClientAccounts.currentAccount]
                              .cartList[PaymentScreen.j]
                              .getCartFoodsLength();
                      i++) {
                    orderFoods.add(ClientAccounts
                        .accounts[ClientAccounts.currentAccount]
                        .cartList[PaymentScreen.j]
                        .cartFoods[i]);
                  }
                  ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .addOrder(ClientActiveOrderTile(
                    RestaurantAccounts.restaurantList[0][PaymentScreen.j].name,
                    Date('2021', '3', '12', '4', '22', '23'),
                    ClientAccounts
                        .accounts[ClientAccounts.currentAccount]
                        .address[ClientAccounts
                            .accounts[ClientAccounts.currentAccount]
                            .currentAddress]
                        .address,
                    RestaurantAccounts
                        .restaurantList[0][PaymentScreen.j].address,
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
                  Navigator.popUntil(
                      context, ModalRoute.withName(/*'/DetailsRestaurantTile'*/
                          '/ClientMainMenuScreen'));
                  Navigator.pushNamed(context,
                      '/ClientMainMenuScreen' /*'/ClientActiveOrdersScreen'*/);
                } else {
                  print('Fuck you your wallet is less than sum price');
                }
              },
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
