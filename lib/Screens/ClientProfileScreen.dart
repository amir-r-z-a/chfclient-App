import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Text/ClientMyPassFormField.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/material.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  var _key1 = GlobalKey<FormState>();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Form(
              key: _key1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  ClientMyTextFormField(
                    'Name',
                    index: 1,
                    initial: ClientAccounts
                        .accounts[ClientAccounts.currentAccount].name,
                    addToAccounts: true,
                    hint: 'Edit Your Name',
                  ),
                  ClientMyTextFormField(
                    'Phone Number',
                    index: 2,
                    initial: ClientAccounts
                        .accounts[ClientAccounts.currentAccount].phoneNumber,
                    addToAccounts: true,
                    hint: 'Edit Your Number',
                  ),
                  ClientMyTextFormField(
                    'Email',
                    index: 4,
                    addToAccounts: true,
                    initial: ClientAccounts
                        .accounts[ClientAccounts.currentAccount].email,
                    regex: 'Email',
                    hint: 'Edit Your Email',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_key1.currentState.validate()) {
                              _key1.currentState.save();
                              print('Features was changed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor),
                          child: Text('Save'))
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,0,0,30)),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ClientMyPassFormField(
                    'Old Password',
                    regex: 'PassEdit1',
                    hint: 'Your old Password',
                  ),
                  ClientMyPassFormField(
                    'New Password',
                    regex: 'PassEdit2',
                    hint: 'Your new Password',
                  ),
                  ClientMyPassFormField(
                    'Confirm Password',
                    regex: 'PassEdit3',
                    hint: 'Your confirm Password',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                            print('Yor password was changed');
                          }
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
