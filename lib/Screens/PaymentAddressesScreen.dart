import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PaymentAddressesScreen extends StatefulWidget {
  static LatLng location;
  static List<LatLng> tappedPoints = [];

  @override
  _PaymentAddressesScreenState createState() => _PaymentAddressesScreenState();
}

class _PaymentAddressesScreenState extends State<PaymentAddressesScreen> {
  var _key1 = GlobalKey<FormState>();

  void refreshPAge() {
    if (this.mounted) {
      setState(() {});
    }
  }

  void _handleTap(LatLng latlng) {
    setState(() {
      print(PaymentAddressesScreen.tappedPoints);
      if (PaymentAddressesScreen.tappedPoints.isEmpty) {
        PaymentAddressesScreen.tappedPoints.add(latlng);
      } else {
        PaymentAddressesScreen.tappedPoints.clear();
        PaymentAddressesScreen.tappedPoints.add(latlng);
      }
      PaymentAddressesScreen.location = latlng;
      print(PaymentAddressesScreen.tappedPoints);
    });
  }

  void addressButtonSheet() {
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
                              PaymentAddressesScreen.tappedPoints.map((latlng) {
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
                                              regex: 'Address',
                                              hint: "Your new address",
                                              addToAccounts: true,
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
                                                    PaymentAddressesScreen
                                                        .location;
                                                if (_key1.currentState
                                                    .validate()) {
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

  @override
  Widget build(BuildContext context) {
    ClientAddressTile.paymentAddressesScreen = refreshPAge;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              ClientAddressTile.trailing = true;
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                  .refreshAllAddress();
              ClientAddressTile.paymentScreen();
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        // centerTitle: true,
        title: Text('Change Addresses'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => addressButtonSheet(),
            child: Container(
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
          ),
          /*Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.3,
                ),
              ),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 4),
            child: Text(
              'Your Addresses',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .getAddressLength() ==
                  0
              ? Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Address not found :(',
                        style: TextStyle(color: Color(0xff808080)),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: List.generate(
                      ClientAccounts.accounts[ClientAccounts.currentAccount]
                          .getAddressLength(),
                      (index) => ClientAccounts
                          .accounts[ClientAccounts.currentAccount]
                          .address[index]),
                )
        ],
      ),
    );
  }
}
