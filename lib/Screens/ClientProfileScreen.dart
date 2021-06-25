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
      backgroundColor: Color(0xffF5F1F7),
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
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 0, 5),
              child: Text(
                'Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xffA4A2A5)),
              ),
            ),
            Form(
              key: _key1,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 360,
                          child: ClientMyTextFormField(
                            'Name',
                            index: 1,
                            initial: ClientAccounts
                                .accounts[ClientAccounts.currentAccount].name,
                            addToAccounts: true,
                            hint: 'Edit Your Name',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.phone),
                        ),
                        SizedBox(
                          width: 360,
                          child: ClientMyTextFormField(
                            'Phone Number',
                            index: 2,
                            initial: ClientAccounts
                                .accounts[ClientAccounts.currentAccount].phoneNumber,
                            addToAccounts: true,
                            hint: 'Edit Your Number',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.alternate_email),
                        ),
                        SizedBox(
                          width: 360,
                          child: ClientMyTextFormField(
                            'Email',
                            index: 4,
                            addToAccounts: true,
                            initial: ClientAccounts
                                .accounts[ClientAccounts.currentAccount].email,
                            regex: 'Email',
                            hint: 'Edit Your Email',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
            Padding(padding: EdgeInsets.fromLTRB(0,0,0,30)),
            Padding(
              padding:  const EdgeInsets.fromLTRB(8, 6, 0, 5),
              child: Text(
                'Password',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xffA4A2A5)),
              ),
            ),
            Form(
              key: _formkey,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              ),
            ),
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
    );
  }
}
