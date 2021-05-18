import 'package:chfclient/Screens/ClientActiveOrdersScreen.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/ClientHomeScreen.dart';
import 'package:chfclient/Screens/ClientOrdersHistoryScreen.dart';
import 'package:flutter/material.dart';

class ClientMainMenuScreen extends StatefulWidget {
  @override
  _ClientMainMenuScreenState createState() => _ClientMainMenuScreenState();
}

class _ClientMainMenuScreenState extends State<ClientMainMenuScreen> {
  int _currentSelect = 1;
  List<Widget> screens = [
    CartScreen(),
    ClientHomeScreen(),
  ];
  String appBarText = 'Cart';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _currentSelect != 2
            ? screens[_currentSelect]
            : TabBarView(children: [
                ClientOrdersHistoryScreen(),
                ClientActiveOrdersScreen(),
              ]),
        drawer: Drawer(),
        appBar: AppBar(
          bottom: _currentSelect == 2
              ? TabBar(tabs: [
                  Tab(
                    child: Text('Orders History'),
                  ),
                  Tab(
                    child: Text('Active Orders'),
                  ),
                ])
              : null,
          centerTitle: true,
          title: Text(appBarText),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelect,
          onTap: (value) {
            setState(() {
              _currentSelect = value;
              if (_currentSelect == 0) {
                appBarText = 'Cart';
              } else if (_currentSelect == 1) {
                appBarText = 'Home';
              } else {
                appBarText = 'Orders';
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'Orders History'),
          ],
        ),
      ),
    );
  }
}
