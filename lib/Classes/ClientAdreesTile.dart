import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ClientAddressTile extends StatefulWidget {
  String address;
  int index;
  Function refreshPage;
  static List<LatLng> tappedPoints = [];
  static Function mainMenu;

  ClientAddressTile(this.address, this.index);

  @override
  _ClientAddressTileState createState() => _ClientAddressTileState();
}

class _ClientAddressTileState extends State<ClientAddressTile> {
  var _key1 = GlobalKey<FormState>();

  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  void editAddress() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var markers = ClientAddressTile.tappedPoints.map((latlng) {
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
        return Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.83,
            child: Form(
              key: _key1,
              child: ListView(children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hold to add pins'),
                    ],
                  ),
                ),
                SizedBox(
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
                Padding(padding: EdgeInsets.only(top: 17)),
                Text(
                  'Address' /*+widget.address*/,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  widget.address,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5, top: 5)),
                ClientMyTextFormField(
                  'Edit Address',
                  index: 3,
                  // initial: widget.address,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (_key1.currentState.validate()) {
                        setState(() {
                          _key1.currentState.save();
                          ClientAccounts.accounts[ClientAccounts.currentAccount]
                              .editAddress(
                                  ClientMyTextFormField.address, widget.index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text('Confirm')),
              ]),
            ),
          ),
        );
      },
    );
  }

  void invalidDeleteAddress() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );
    // tamame address ha qabel pak shodan bashand vali moqe sabt sefaresh nagozarad sefaresh sabt konad
  }

  void _handleTap(LatLng latlng) {
    setState(() {
      print(ClientAddressTile.tappedPoints);
      if (ClientAddressTile.tappedPoints.isEmpty) {
        ClientAddressTile.tappedPoints.add(latlng);
      } else {
        ClientAddressTile.tappedPoints.clear();
        ClientAddressTile.tappedPoints.add(latlng);
      }
      print(ClientAddressTile.tappedPoints);
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.refreshPage = refreshPage;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(15, 10, 10, 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: ClientAccounts
                      .accounts[ClientAccounts.currentAccount].currentAddress ==
                  widget.index
              ? Border.all(width: 1.1, color: Theme.of(context).primaryColor)
              : null),
      child: GestureDetector(
        onTap: () {
          ClientAccounts.accounts[ClientAccounts.currentAccount]
              .currentAddress = widget.index;
          ClientAccounts.accounts[ClientAccounts.currentAccount]
              .refreshAllAddress();
        },
        child: ListTile(
          leading: ClientAccounts
                      .accounts[ClientAccounts.currentAccount].currentAddress ==
                  widget.index
              ? Icon(
                  Icons.check_circle_rounded,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(Icons.radio_button_unchecked),
          title: Text(widget.address),
          trailing: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '#' +
                                        (widget.index + 1).toString() +
                                        (ClientAccounts
                                                    .accounts[ClientAccounts
                                                        .currentAccount]
                                                    .currentAddress ==
                                                widget.index
                                            ? ' (Current Address)'
                                            : ''),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(Icons.cancel_outlined))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                ClientAccounts.digester(widget.address, 100),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 185,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor),
                                      onPressed: () => editAddress(),
                                      child: Text('Details')),
                                ),
                                SizedBox(
                                  width: 185,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        if (ClientAccounts.accounts[
                                                ClientAccounts.currentAccount]
                                            .deleteAddress(widget.index)) {
                                          ClientAddressTile.mainMenu();
                                          Navigator.pop(context);
                                        } else {}
                                        //delete alertDialog
                                      },
                                      child: Text('Delete')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
