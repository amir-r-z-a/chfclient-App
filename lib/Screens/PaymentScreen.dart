import 'dart:io';
import 'dart:math';

import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Screens/ClientMainMenuScreen.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PaymentScreen extends StatefulWidget {
  static LatLng location;
  static List<LatLng> tappedPoints = [];
  static int j;
  static bool isOnlinePayment = true;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _key1 = GlobalKey<FormState>();
  var _key2 = GlobalKey<FormState>();

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

  void enoughWallet() async {
    if (ClientAccounts.accounts[ClientAccounts.currentAccount]
            .getAddressLength() !=
        0) {
      List<FinishedClientFoodTile> orderFoods = List<FinishedClientFoodTile>();
      Date date = Date();
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
        date,
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
      ClientMainMenuScreen.activeOrder = true;
      String foodNames = ' {, ';
      String numbers = ' {, ';
      for (int i = 0;
          i <
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .cartList[PaymentScreen.j].cartNum.length;
          i++) {
        String string = ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[PaymentScreen.j].cartNum[i]
            .toString();
        print('your cart num: ' +
            (string == null || string == 'null' || string.isEmpty
                ? 'null:)'
                : string));
      }
      for (int i = 0;
          i <
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .cartList[PaymentScreen.j].cartName.length;
          i++) {
        String string = ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[PaymentScreen.j].cartName[i];
        print('your cart name: ' +
            (string == null || string.isEmpty ? 'null:)' : string));
      }

      for (int i = 0;
          i <
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .cartList[PaymentScreen.j].cartName.length;
          i++) {
        String name = ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[PaymentScreen.j].cartName[i];
        String number = ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[PaymentScreen.j].cartNum[i]
            .toString();
        if (!(number == null ||
            number == 'null' ||
            number.isEmpty ||
            number == '0')) {
          numbers += number;
          numbers += ', ';
          if (!(name == null || name == 'null' || name.isEmpty)) {
            foodNames += name;
            foodNames += ", ";
          }
        }
      }
      foodNames += "}";
      numbers += '}';
      String listen = '';
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        String write = 'ClientOrders-AddOrder-' +
            RestaurantAccounts
                .restaurantList[0][DetailsRestaurantTile.j].phoneNumber +
            '-' +
            ClientAccounts.accounts[ClientAccounts.currentAccount].name +
            '-' +
            ClientAccounts.accounts[ClientAccounts.currentAccount].phoneNumber +
            '-' +
            ClientAccounts
                .accounts[ClientAccounts.currentAccount]
                .address[ClientAccounts
                    .accounts[ClientAccounts.currentAccount].currentAddress]
                .address +
            '-' +
            ClientAccounts
                .accounts[ClientAccounts.currentAccount]
                .address[ClientAccounts
                    .accounts[ClientAccounts.currentAccount].currentAddress]
                .location
                .toString()
                .replaceAll(', ', ':::') +
            '-Date(20' +
            date.year +
            ':' +
            date.month +
            ':' +
            date.day +
            ':' +
            date.hour +
            ':' +
            date.minute +
            ':' +
            date.second +
            ')-' +
            PaymentScreen.isOnlinePayment.toString() +
            '-' +
            foodNames +
            '-' +
            numbers +
            '-' +
            RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j].name +
            '-' +
            ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[PaymentScreen.j].cartSum[-1].toString() +
            '-' +
            ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[PaymentScreen.j].cartNum[-1].toString();
        write = (write.length + 7).toString() + ',Client-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
          ClientAccounts.accounts[ClientAccounts.currentAccount]
              .removeCart(PaymentScreen.j);
          Navigator.popUntil(
              context, ModalRoute.withName('/ClientMainMenuScreen'));
          Navigator.pushNamed(context, '/ClientMainMenuScreen');
        });
        // serverSocket.close();
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Address not added'),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Text('Unregistered address, Please register the address first'),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'OK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  void _handleTap(LatLng latlng) {
    setState(() {
      print(PaymentScreen.tappedPoints);
      if (PaymentScreen.tappedPoints.isEmpty) {
        PaymentScreen.tappedPoints.add(latlng);
      } else {
        PaymentScreen.tappedPoints.clear();
        PaymentScreen.tappedPoints.add(latlng);
      }
      PaymentScreen.location = latlng;
      print(PaymentScreen.tappedPoints);
    });
  }

  void addressButtonSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          var markers = PaymentScreen.tappedPoints.map((latlng) {
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
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text('Hold to add pins'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 300,
                        child: FlutterMap(
                          options: MapOptions(
                              center: LatLng(35.715298, 51.404343),
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
                              regex: 'Address',
                              hint: "Your new address",
                              addToAccounts: true,
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor),
                              onPressed: () {
                                ClientMyTextFormField.location =
                                    PaymentScreen.location;
                                if (_key1.currentState.validate()) {
                                  setState(() {
                                    _key1.currentState.save();
                                    Navigator.pop(context);
                                  });
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
              onPressed: () => PaymentScreen.isOnlinePayment
                  ? ClientAccounts.accounts[ClientAccounts.currentAccount]
                          .validPayment(ClientAccounts
                              .accounts[ClientAccounts.currentAccount]
                              .cartList[PaymentScreen.j]
                              .cartSum[-1])
                      ? enoughWallet()
                      : notEnoughWallet()
                  : enoughWallet(),
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
      body: ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .getAddressLength() ==
              0
          ? GestureDetector(
              onTap: () => addressButtonSheet(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15),
                child: DottedBorder(
                  dashPattern: [8, 2.6],
                  strokeWidth: 2,
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'New Address',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          : ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 15, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              ClientAddressTile.trailing = false;
                              Navigator.pushNamed(
                                  context, '/PaymentAddressesScreen');
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Change Address',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClientAccounts
                            .accounts[ClientAccounts.currentAccount].address[
                        ClientAccounts.accounts[ClientAccounts.currentAccount]
                            .currentAddress]
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 1.1,
                              color: PaymentScreen.isOnlinePayment
                                  ? Theme.of(context).primaryColor
                                  : Color(0xff999999)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PaymentScreen.isOnlinePayment =
                                  !PaymentScreen.isOnlinePayment;
                            });
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.credit_card_outlined,
                              color: PaymentScreen.isOnlinePayment
                                  ? Theme.of(context).primaryColor
                                  : null,
                            ),
                            title: Text('Online Payment'),
                            trailing: PaymentScreen.isOnlinePayment
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : Icon(Icons.radio_button_unchecked),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 1.1,
                              color: !PaymentScreen.isOnlinePayment
                                  ? Theme.of(context).primaryColor
                                  : Color(0xff999999)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              PaymentScreen.isOnlinePayment =
                                  !PaymentScreen.isOnlinePayment;
                            });
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.attach_money,
                              color: !PaymentScreen.isOnlinePayment
                                  ? Theme.of(context).primaryColor
                                  : null,
                            ),
                            title: Text('Cash Payment'),
                            trailing: !PaymentScreen.isOnlinePayment
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : Icon(Icons.radio_button_unchecked),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Discount Code ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Form(
                          child: Padding(
                        key: _key2,
                        padding: const EdgeInsets.fromLTRB(8, 0, 18, 0),
                        child: TextFormField(
                          cursorColor: Color.fromRGBO(248, 95, 106, 1),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Color.fromRGBO(248, 95, 106, 1),
                            ),
                            labelText: "Discount",
                            //TODO
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(248, 95, 106, 1)),
                            hintText: "Your Discount Code ",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(209, 214, 219, 1),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
