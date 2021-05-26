import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var _key1 = GlobalKey<FormState>();

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key1,
      child: Scaffold(
        bottomNavigationBar: Padding(
            child: ElevatedButton(
              onPressed: () {
                if (_key1.currentState.validate()) {
                  setState(() {
                    _key1.currentState.save();
                    ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .addWallet(ClientMyTextFormField.wallet);
                    ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .changeLastIncrease(
                            Date('2021', '3', '12', '4', '22', '23'));
                    ClientMyTextFormField.wallet = 0;
                  });
                }
              },
              child: Text('Payment'),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
            ),
            padding: EdgeInsets.all(8.00)),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Wallet'),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
            Card(
              child: ListTile(
                leading: Icon(Icons.credit_card_outlined),
                title: Text('Current Balance: \$' +
                    ClientAccounts
                        .accounts[ClientAccounts.currentAccount].wallet
                        .toString() +
                    '0'),
                subtitle: Text('Last Increase: ' +
                    (ClientAccounts.accounts[ClientAccounts.currentAccount]
                                .lastIncrease !=
                            null
                        ? ClientAccounts.accounts[ClientAccounts.currentAccount]
                            .lastIncrease
                            .dateFormatter()
                        : 'This is first Increase')),
              ),
            ),
            Card(
              child: Container(
                height: 445,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                        Text(
                          'Increase Balance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(70)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // setState(() {
                            // initState();
                            ClientMyTextFormField.wallet++;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, '/WalletScreen');
                            // rebuildAllChildren(context);
                            // });
                          },
                          child: Container(
                            child:
                                Icon(Icons.add_outlined, color: Colors.white),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border.all(
                                  width: 0.7,
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 280,
                            child: ClientMyTextFormField(
                              '',
                              suffix: 'Dollar',
                              initial:
                                  ClientMyTextFormField.wallet.toString() + '0',
                              index: 6,
                              regex: 'Wallet',
                              contentPadding: EdgeInsets.fromLTRB(125, 0, 0, 0),
                            )),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (ClientMyTextFormField.wallet >= 1) {
                                ClientMyTextFormField.wallet--;
                              }
                            });
                          },
                          child: Container(
                            child: Icon(
                              Icons.remove,
                              color: Theme.of(context).primaryColor,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.7,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
