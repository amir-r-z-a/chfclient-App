import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/material.dart';

class ClientDetailsCommentTile extends StatefulWidget {
  static String question;
  static String answer;

  @override
  _ClientDetailsCommentTileState createState() =>
      _ClientDetailsCommentTileState();
}

class _ClientDetailsCommentTileState extends State<ClientDetailsCommentTile> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comment Details"),
      ),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: (MediaQuery.of(context).size.height) / 3 + 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                        child: Row(
                          children: [Expanded(child: Text("Question : "))],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(ClientDetailsCommentTile.question))
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           primary: Theme.of(context).primaryColor),
                      //       onPressed: () {
                      //         showModalBottomSheet(
                      //           context: context,
                      //           builder: (context) {
                      //             return ListView(
                      //               children: [
                      //                 Form(
                      //                   key: _formkey,
                      //                   child: Column(
                      //                     children: [
                      //                       Padding(
                      //                         padding:
                      //                         const EdgeInsets.all(10.0),
                      //                         child: ClientMyTextFormField('Reply',
                      //                             index: 9,
                      //                             initial: ClientDetailsCommentTile
                      //                                 .answer),
                      //                       ),
                      //                       ElevatedButton(
                      //                         style: ElevatedButton.styleFrom(
                      //                             primary: Theme.of(context)
                      //                                 .primaryColor),
                      //                         onPressed: () {
                      //                           setState(() {
                      //                             if (_formkey.currentState
                      //                                 .validate()) {
                      //                               _formkey.currentState
                      //                                   .save();
                      //                               Accounts.accounts[Accounts
                      //                                   .currentAccount]
                      //                                   .editCommentsAnswer(
                      //                                   DetailsCommentTile
                      //                                       .id,
                      //                                   MyTextFormField
                      //                                       .reply);
                      //                               DetailsCommentTile.answer =
                      //                                   MyTextFormField.reply;
                      //                               DetailsCommentTile
                      //                                   .function();
                      //                               Navigator.pop(context);
                      //                             }
                      //                           });
                      //                         },
                      //                         child: Text("Save"),
                      //                       )
                      //                     ],
                      //                   ),
                      //                 )
                      //               ],
                      //             );
                      //           },
                      //         );
                      //       },
                      //       child: Text("Reply")),
                      // )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: (MediaQuery.of(context).size.height) / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [Expanded(child: Text("Answer : "))],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(children: [
                                Expanded(
                                  child: Text((ClientDetailsCommentTile
                                                  .answer !=
                                              null &&
                                          ClientDetailsCommentTile.answer != ''
                                      ? ClientDetailsCommentTile.answer
                                      : 'You have not answered yet')),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
