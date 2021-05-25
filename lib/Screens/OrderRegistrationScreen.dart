import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/Screens/PaymentScreen.dart';
import 'package:flutter/material.dart';

class OrderRegistrationScreen extends StatefulWidget {
  static int j;
  static List<Function> clientFoods = [];
  static bool flag = false;
  static Function cartScreen;
  static Function detailsRestaurant;

  @override
  _OrderRegistrationScreenState createState() =>
      _OrderRegistrationScreenState();
}

class _OrderRegistrationScreenState extends State<OrderRegistrationScreen> {
  void deleteFunc() {
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .newCart(OrderRegistrationScreen.j);
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // void payment() {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Payment'),
  //         content: Container(
  //           height: 190,
  //           child: Column(
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     width: 0.3,
  //                   ),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     Radio(
  //                       value: 0,
  //                       groupValue: selectedRadio,
  //                       onChanged: (value) => setSelectedRadio(value),
  //                     ),
  //                     Text('Online Payment'),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     width: 0.3,
  //                   ),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     Radio(
  //                       value: 1,
  //                       groupValue: selectedRadio,
  //                       onChanged: (value) => setSelectedRadio(value),
  //                     ),
  //                     Text('Wallet'),
  //                   ],
  //                 ),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   TextButton(
  //                       onPressed: () => Navigator.pop(context),
  //                       child: Text('Payment')),
  //                   TextButton(
  //                       onPressed: () => Navigator.pop(context),
  //                       child: Text('Cancel'))
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.00),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {
            PaymentScreen.j = OrderRegistrationScreen.j;
            Navigator.pushNamed(context, '/PaymentScreen');
          },
          child: Text('Continue'),
        ),
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
                      .cartList[OrderRegistrationScreen.j]
                      .getCartNameLength() -
                  1,
              (index) {
                if (ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[DetailsRestaurantTile.j].cartNum[index] !=
                    0) {
                  return ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .cartList[OrderRegistrationScreen.j].cartFoods[index];
                }
                return Container(
                  height: 0,
                  width: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
