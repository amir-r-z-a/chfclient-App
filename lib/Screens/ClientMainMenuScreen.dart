import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Screens/ClientActiveOrdersScreen.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/ClientHomeScreen.dart';
import 'package:chfclient/Screens/ClientOrdersHistoryScreen.dart';
import 'package:flutter/material.dart';

class customListTile extends StatefulWidget {
  IconData icon;
  String text;
  Function ontap;

  customListTile(this.icon, this.text, this.ontap);

  @override
  _customListTileState createState() => _customListTileState();
}

class _customListTileState extends State<customListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Colors.deepOrange,
        onTap: widget.ontap,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.orange,
                        Colors.deepOrange,
                      ])),
                  child: Text('here is header')),
              customListTile(Icons.person, 'Profile',()=>{}),
              customListTile(Icons.comment , 'My Comments ',()=>{}),
              customListTile(Icons.monetization_on, 'My Wallet',()=>{}),
              customListTile(Icons.phone, 'Contact Us', () => {}),
              customListTile(Icons.logout, "Log Out", () => {}),
            ],
          )
        ),
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
