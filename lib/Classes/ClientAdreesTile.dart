import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class ClientAddressTile extends StatefulWidget {
  String address;
  int index;
  Function refreshPage;

  ClientAddressTile(this.address, this.index);

  @override
  _ClientAddressTileState createState() => _ClientAddressTileState();
}

class _ClientAddressTileState extends State<ClientAddressTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.refreshPage = refreshPage;
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          ClientAccounts.accounts[ClientAccounts.currentAccount]
              .currentAddress = widget.index;
          ClientAccounts.accounts[ClientAccounts.currentAccount]
              .refreshAllAddress();
        },
        child: ClientAccounts
                    .accounts[ClientAccounts.currentAccount].currentAddress ==
                widget.index
            ? Icon(
                Icons.check_circle_rounded,
                color: Theme.of(context).primaryColor,
              )
            : Icon(Icons.radio_button_unchecked),
      ),
      /*Radio(
        value: ClientAccounts.accounts[ClientAccounts.currentAccount]
                .getAddressLength() -
            1,
        groupValue: selectedRadio,
        onChanged: (value) => setSelectedRadio(value),
      )*/
      title: Text(widget.address),
      trailing: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 100,
                  child: ListView(
                    children: [
                      Text(widget.address),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.mode_edit),
                            Text('Edit')
                          ], //icon edit was not corrected
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              vertical: BorderSide(width: 0.3)),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [Icon(Icons.delete), Text('Delete')],
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              vertical: BorderSide(width: 0.3)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(Icons.more_vert)),
    );
  }
}
