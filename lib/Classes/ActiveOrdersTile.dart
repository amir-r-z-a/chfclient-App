import 'package:flutter/material.dart';
class ActiveOrderTile extends StatefulWidget {
  const ActiveOrderTile({Key key}) : super(key: key);

  @override
  _ActiveOrderTileState createState() => _ActiveOrderTileState();
}

class _ActiveOrderTileState extends State<ActiveOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // click to see all the order with  foods
          onTap: () {
            //TODO
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "restauraante Chamooli",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Text("15/05/2020"),
                                    Icon(Icons.watch_later_outlined),
                                    Text("12:15")
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text("velenjak , meydan Daneshjoo ...")
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 18, 12, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sum of Prices"),
                      Text("105 \$"),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(50, 18, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //TODO
                          },
                          child: Text("Continue"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //TODO
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
