import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/ClientHomeScreen.dart';
import 'package:chfclient/Screens/OrdersScreen.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _currentSelect = 1;
  List<Widget> screens = [
    CartScreen(),
    ClientHomeScreen(),
    OrdersScreen(),
  ];
  String appBarText = 'Cart';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: screens[_currentSelect],
        appBar: AppBar(
          bottom: _currentSelect == 2 ? TabBar(tabs: [Tab(), Tab()]) : null,
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
