import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/ClientDetailsCommentTile.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  String _question;
  String answer;
  String _clientPhoneNumber;
  String _destinationRestaurant;
  String _foodName;
  String _point;
  Date _date;
  String _id;

  CommentTile(this._question, this._foodName, this._date,
      this._clientPhoneNumber, this._destinationRestaurant,
      {this.answer});

  String get question => _question;

  set question(String value) {
    _question = value;
  }

  String get clientPhoneNumber => _clientPhoneNumber;

  set clientPhoneNumber(String value) {
    _clientPhoneNumber = value;
  }

  Date get date => _date;

  set date(Date value) {
    _date = value;
  }

  String get point => _point;

  set point(String value) {
    _point = value;
  }

  String get destinationRestaurant => _destinationRestaurant;

  set destinationRestaurant(String value) {
    _destinationRestaurant = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get foodName => _foodName;

  set foodName(String value) {
    _foodName = value;
  }

  String getNameOfRestaurant() {
    for (int i = 0; i < RestaurantAccounts.getRestaurantListLength(); i++) {
      if (RestaurantAccounts.restaurantList[0][i].phoneNumber ==
          destinationRestaurant) {
        return RestaurantAccounts.restaurantList[0][i].name;
      }
    }
    return '-1';
  }

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ClientDetailsCommentTile.question = widget.question;
        ClientDetailsCommentTile.answer = widget.answer;
        // DetailsCommentTile.id = widget.id;
        // DetailsCommentTile.function = refreshPage;
        Navigator.pushNamed(context, '/ClientDetailsCommentTile');
      },
      child: SizedBox(
        height: 300,
        child: Card(
          child: ListTile(
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.date.dateFormatter() +
                    '\n' +
                    ClientAccounts.digester(
                        widget.getNameOfRestaurant() +
                            '(' +
                            widget.foodName +
                            ')',
                        50) +
                    '\n' +
                    widget.id +
                    '\n\n\n\n\n\n'),
                Text(
                  'Answer: ',
                  style: TextStyle(color: Colors.black),
                ),
                widget.answer == null || widget.answer == ''
                    ? Text('You have not answered yet')
                    : Text(
                        ClientAccounts.digester(widget.answer, 56),
                        style: TextStyle(color: Colors.black),
                      )
              ],
            ),
            title: Text(ClientAccounts.digester(widget.question, 128)),
          ),
        ),
      ),
    );
  }
}
//agar karbar tarikh ra injoori vared kard 2012/3/2 barname injoori tabdil konad 2012/03/02
