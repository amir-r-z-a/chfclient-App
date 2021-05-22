import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Text/ClientMyPassFormField.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var  _key = GlobalKey<FormState>();
  var  _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: Container(
          child: Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              children: [
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      Text(
                        'Features',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      ClientMyTextFormField(
                        'Name',
                        index: 1,
                        initial: ClientAccounts.accounts[ClientAccounts.currentAccount].name,
                        addToAccounts: true,
                        hint: 'Edit Your Name',
                      ),
                      ClientMyTextFormField(
                        'Phone Number',
                        index: 2,
                        initial: ClientAccounts.accounts[ClientAccounts.currentAccount].phoneNumber,
                        addToAccounts: true,
                        hint: 'Edit Your Number',
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Text(
                                'Password',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                            Padding(padding: EdgeInsets.all(5)),
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
                )
              ],
            ),
          ),
        ));
  }
}
