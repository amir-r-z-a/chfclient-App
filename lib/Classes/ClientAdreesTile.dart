import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class ClientAddressTile extends StatefulWidget {
  static Function mainMenu;

  @override
  _ClientAddressTileState createState() => _ClientAddressTileState();
}

class _ClientAddressTileState extends State<ClientAddressTile> {
  int selectedRadio;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
    // ClientAddressTile.mainMenu();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        value: ClientAccounts.accounts[ClientAccounts.currentAccount]
                .getAddressLength() -
            1,
        groupValue: selectedRadio,
        onChanged: (value) => setSelectedRadio(value),
      ),
      title: Text(
        ClientAccounts.accounts[ClientAccounts.currentAccount].address[
            ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .getAddressLength() -
                1],
      ),
      trailing: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: [
                    Text(ClientAccounts
                            .accounts[ClientAccounts.currentAccount].address[
                        ClientAccounts.accounts[ClientAccounts.currentAccount]
                            .currentAddress]),
                    Container(
                      child: Row(
                        children: [Icon(Icons.mode_edit), Text('Edit')],//icon edit was not corrected
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.symmetric(vertical: BorderSide(width: 0.3)),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [Icon(Icons.delete), Text('Delete')],
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.symmetric(vertical: BorderSide(width: 0.3)),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.more_vert)),
    );
  }
}
