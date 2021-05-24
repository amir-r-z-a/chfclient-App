import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
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
        title: Text('My Comments'),
      ),
      body: ListView(
        children: [
          Column(
            children: List.generate(
                ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .getClientCommentsLength(),
                (index) => ClientAccounts
                    .accounts[ClientAccounts.currentAccount]
                    .clientComments[index]),
          )
        ],
      ),
    );
  }
}
