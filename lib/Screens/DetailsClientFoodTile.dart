import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/Screens/OrderRegistrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsClientFoodTile extends StatefulWidget {
  static String name;
  static String desc;
  static String price;
  static bool foodStatus;
  static int counter;
  static List<CommentTile> comments;
  static Widget myContainer;
  static Widget myRow;
  static Function counterCalculator;
  static Function goToOrderRegistration;
  static Function addComment;

  static int getCommentsLength() {
    return comments.length;
  }

  @override
  _DetailsClientFoodTileState createState() => _DetailsClientFoodTileState();
}

class _DetailsClientFoodTileState extends State<DetailsClientFoodTile> {
  var key1 = GlobalKey<FormState>();

  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ClientFoodTile.detailsAddMinCart = refreshPage;
    return Scaffold(
      bottomNavigationBar: DetailsClientFoodTile.counterCalculator() > 0
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () => DetailsClientFoodTile.goToOrderRegistration(),
                child: Text('Finished (' +
                    DetailsClientFoodTile.counterCalculator().toString() +
                    ')'),
              ),
            )
          : null,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              OrderRegistrationScreen.flag = false;
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Padding(padding: EdgeInsets.all(7)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(2)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DetailsClientFoodTile.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Text(DetailsClientFoodTile.desc),
                    Padding(padding: EdgeInsets.all(3)),
                    Text('Price: ' +
                        '\$' +
                        DetailsClientFoodTile.price.toString()),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(2)),
                    Text(
                      DetailsClientFoodTile.foodStatus ? 'Active' : 'Inactive',
                      style: TextStyle(
                          color: DetailsClientFoodTile.foodStatus
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DetailsClientFoodTile.counter == 0
                        ? DetailsClientFoodTile.myContainer
                        : DetailsClientFoodTile.myRow,
                    Padding(padding: EdgeInsets.all(2)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(50),
            ),
            Row(children: [
              Padding(padding: EdgeInsets.all(5)),
              Text(
                'Comments',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Column(
              children: List.generate(
                DetailsClientFoodTile.getCommentsLength(),
                (index) => DetailsClientFoodTile.comments[index],
              ),
            ),
            Form(
              key: key1,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  ClientMyTextFormField(
                    'Comment',
                    index: 5,
                    hint: 'Please enter your comment',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                      onPressed: () {
                        if (key1.currentState.validate()) {
                          setState(() {
                            key1.currentState.save();
                            CommentTile commentTile = CommentTile(
                                ClientMyTextFormField.question,
                                DetailsClientFoodTile.name,
                                Date('0', '0', '0', '0', '0', '0'),
                                ClientAccounts
                                    .accounts[ClientAccounts.currentAccount]
                                    .phoneNumber,
                                RestaurantAccounts
                                    .restaurantList[0][DetailsRestaurantTile.j]
                                    .phoneNumber);
                            commentTile.id =
                                ClientAccounts.commentsIDGenerator(commentTile);
                            ClientAccounts
                                .accounts[ClientAccounts.currentAccount]
                                .addComment(commentTile);
                            DetailsClientFoodTile.addComment(commentTile);
                            // DetailsClientFoodTile.comments.add(commentTile);
                            // ClientMyTextFormField.question='';
                          });
                        }
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (context) {
                        //     return ListView(
                        //       children: [],
                        //     );
                        //   },
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      child: Text('Add Comment')),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(150),
            ),
          ],
        ),
      ),
    );
  }
}

//Container(
//                         height: 25,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                           border: Border.all(width: 0.7, color: Colors.black),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Add',
//                             style: TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
