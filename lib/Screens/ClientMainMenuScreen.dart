import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Screens/ClientActiveOrdersScreen.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/ClientHomeScreen.dart';
import 'package:chfclient/Screens/ClientOrdersHistoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
  static LatLng location;
  static List<LatLng> tappedPoints = [];
  static bool activeOrder = false;
  static bool changeAppBarAddress = false;

  @override
  _ClientMainMenuScreenState createState() => _ClientMainMenuScreenState();
}

class _ClientMainMenuScreenState extends State<ClientMainMenuScreen> {
  var _key1 = GlobalKey<FormState>();

  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  int _currentSelect = 1;
  List<Widget> screens = [
    CartScreen(),
    ClientHomeScreen(),
  ];
  String appBarText = '        -';

  /*ClientAccounts
      .accounts[ClientAccounts.currentAccount]
      .address[
          ClientAccounts.accounts[ClientAccounts.currentAccount].currentAddress]
      .address*/

  void addressButtonSheet() {
    ClientAddressTile.trailing = false;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Address List',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          var markers =
                              ClientMainMenuScreen.tappedPoints.map((latlng) {
                            return Marker(
                              width: 80.0,
                              height: 80.0,
                              point: latlng,
                              builder: (ctx) => Container(
                                child: Icon(
                                  Icons.location_on,
                                  size: 50,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }).toList();
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Text('Hold to add pins'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 300,
                                        child: FlutterMap(
                                          options: MapOptions(
                                              center:
                                                  LatLng(35.715298, 51.404343),
                                              zoom: 13.0,
                                              onTap: _handleTap),
                                          layers: [
                                            TileLayerOptions(
                                              urlTemplate:
                                                  "https://api.mapbox.com/styles/v1/amirrza/ckov1rtrs059m17p8xugrutr4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW1pcnJ6YSIsImEiOiJja292MW0zeGwwNDN1MnBwYzlhbDVyOHByIn0.Mwa8L0WNjyIKc-v32nKOhQ",
                                            ),
                                            MarkerLayerOptions(markers: markers)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _key1,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClientMyTextFormField(
                                              "Address",
                                              index: 3,
                                              hint: "Your new address",
                                              addToAccounts: true,
                                              regex: 'Address',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 350,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Theme.of(context)
                                                      .primaryColor),
                                              onPressed: () {
                                                ClientMyTextFormField.location =
                                                    ClientMainMenuScreen
                                                        .location;
                                                if (_key1.currentState
                                                    .validate()) {
                                                  _key1.currentState.save();
                                                  if (ClientAccounts.accounts[
                                                              ClientAccounts
                                                                  .currentAccount]
                                                          .getAddressLength() ==
                                                      1) {
                                                    setState(() {
                                                      appBarTitle(1);
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text('Save'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    // ElevatedButton(onPressed: ()=> print(ProfileScreen.tappedPoints), child: Text("save"))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Text(
                        'New Address',
                      ),
                      Icon(Icons.add)
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: List.generate(
                  ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .getAddressLength(),
                  (index) => ClientAccounts
                      .accounts[ClientAccounts.currentAccount].address[index]),
            )
          ],
        );
      },
    );
  }

  void appBarTitle(int value) {
    setState(() {
      _currentSelect = value;
      if (_currentSelect == 0) {
        appBarText = 'Cart';
      } else if (_currentSelect == 1) {
        appBarText = ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .getAddressLength() ==
                0
            ? '        -'
            : ClientAccounts
                .accounts[ClientAccounts.currentAccount]
                .address[ClientAccounts
                    .accounts[ClientAccounts.currentAccount].currentAddress]
                .address;
      } else {
        appBarText = 'Orders';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ClientAddressTile.mainMenu = refreshPage;
    if (ClientMainMenuScreen.activeOrder) {
      // setState(() {
      _currentSelect = 2;
      appBarTitle(2);
      ClientMainMenuScreen.activeOrder = false;
      // });
    }
    if (ClientMainMenuScreen.changeAppBarAddress) {
      // setState(() {
      appBarTitle(1);
      ClientMainMenuScreen.changeAppBarAddress = false;
      // });
    }
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
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
                  ]),
                ),
                child: Text('here is header')),
            customListTile(Icons.person, 'Profile',
                () => Navigator.pushNamed(context, '/ProfileScreen')),
            customListTile(Icons.credit_card_outlined, 'My Wallet',
                () => Navigator.pushNamed(context, '/WalletScreen')),
            customListTile(Icons.favorite_border, 'My Fav Restaurants ',
                () => Navigator.pushNamed(context, '/FavRestaurantsScreen')),
            customListTile(Icons.comment, 'My Comments ',
                () => Navigator.pushNamed(context, '/CommentsScreen')),
            customListTile(Icons.phone, 'Contact Us', () => {}),
            customListTile(
              Icons.logout,
              "Log Out",
              () {
                Navigator.popUntil(
                    context, ModalRoute.withName('/ClientSignInScreen'));
                Navigator.pushNamed(context, '/ClientSignInScreen');
              },
            ),
          ],
        )),
        appBar: AppBar(
          bottom: _currentSelect == 2
              ? TabBar(
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                      Tab(
                        child: Text('Orders History'),
                      ),
                      Tab(
                        child: Text('Active Orders'),
                      ),
                    ])
              : null,
          centerTitle: true,
          title: _currentSelect != 1
              ? Text(appBarText)
              : GestureDetector(
                  onTap: () => addressButtonSheet(),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(80, 0, 0, 0)),
                      Text(/*' ' + */ ClientAccounts.digester(appBarText, 10)),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelect,
          onTap: (value) => appBarTitle(value),
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

  void _handleTap(LatLng latlng) {
    setState(() {
      if (ClientMainMenuScreen.tappedPoints.isEmpty) {
        ClientMainMenuScreen.tappedPoints.add(latlng);
      } else {
        ClientMainMenuScreen.tappedPoints.clear();
        ClientMainMenuScreen.tappedPoints.add(latlng);
      }
      ClientMainMenuScreen.location = latlng;
      print(ClientMainMenuScreen.tappedPoints);
    });
  }
}
