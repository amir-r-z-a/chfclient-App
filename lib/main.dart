import 'package:chfclient/Classes/Accounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';
import 'package:chfclient/Screens/ClientSignInScreen.dart';
import 'package:chfclient/Screens/ClientSignUpScreen.dart';
import 'package:chfclient/Screens/InvoiceDetailsScreeen.dart';
import 'package:chfclient/Screens/ClientMainMenuScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CHFood",
      theme: ThemeData(primaryColor: const Color.fromRGBO(248, 95, 106, 1)),
      routes: {
        '/ClientSignUpScreen': (context) => ClientSignUpScreen(),
        '/ClientSignInScreen': (context) => ClientSignInScreen(),
        '/MainMenuScreen': (context) => ClientMainMenuScreen(),
      },
      home:
          // ClientSignInScreen(),
          // ClientActiveOrderTile()
          // ClientFoodTile()
          // ClientOrderTile()
          ClientMainMenuScreen(),
      // InvoiceDetailsScreen()
    );
  }
}

void main() {
  Client client = Client(
    'Client1',
    '09198612878',
    'clientPassword1',
    ['address1', 'address2'],
  );
  Accounts.addAccount(client);
  runApp(MyApp());
}
