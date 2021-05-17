import 'package:flutter/material.dart';

class ClientFoodTile extends StatefulWidget {
  const ClientFoodTile({Key key}) : super(key: key);

  @override
  _ClientFoodTileState createState() => _ClientFoodTileState();
}

class _ClientFoodTileState extends State<ClientFoodTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(12),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Food Name"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("here is the placer for Food description ..."),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 12, 0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
