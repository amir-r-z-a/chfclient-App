// import 'package:flutter/material.dart';
//
// import 'Accounts.dart';
//
// class ClientFoodTile extends StatefulWidget {
//   const ClientFoodTile({Key key}) : super(key: key);
//
//   @override
//   _ClientFoodTileState createState() => _ClientFoodTileState();
// }
//
// class _ClientFoodTileState extends State<ClientFoodTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//     },
//     child: Container(
//     decoration: BoxDecoration(
//     border: Border.symmetric(
//     horizontal: BorderSide(color: Color(0xffDCDCDC), width: 1)),
//     ),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//     Padding(padding: EdgeInsets.symmetric(vertical: 3)),
//     Row(children: [
//     Padding(padding: EdgeInsets.all(7)),
//     Container(
//     decoration:
//     BoxDecoration(border: Border.all(color: Colors.black)),
//     height: 95,
//     width: 95,
//     ),
//     Padding(padding: EdgeInsets.all(5)),
//     Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(Accounts.digester(widget.name,
//     MediaQuery.of(context).size.width.floor() - 372)),
//     Padding(padding: EdgeInsets.all(3)),
//     Text(Accounts.digester(
//     widget.desc == null ? ' ' : widget.desc,
//     MediaQuery.of(context).size.width.floor() - 372)),
//     Padding(padding: EdgeInsets.all(13)),
//     Text(Accounts.digester(
//     'Price: ' + '\$' + widget.price.toString(),
//     MediaQuery.of(context).size.width.floor() - 372)),
//     ],
//     ),
//     ]),
//     Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Row(
//     children: [
//     Padding(padding: EdgeInsets.all(3)),
//     SizedBox(
//     // height: 10,
//     // width: 100,
//     child: Switch(
//     inactiveThumbColor: Colors.red,
//     inactiveTrackColor: Colors.red,
//     activeTrackColor: Color.fromRGBO(0, 181, 0, 1),
//     activeColor: Color.fromRGBO(0, 181, 0, 1),
//     value: widget.foodStatus,
//     onChanged: (value) {
//     setState(() {
//     Accounts.accounts[Accounts.currentAccount]
//         .topTenFoodsSwitch(widget.name);
//     widget.foodStatus = !widget.foodStatus;
//     });
//     },
//     ),
//     ),
//     Text(
//     widget.foodStatus ? 'Active' : 'Inactive',
//     style: TextStyle(
//     color: widget.foodStatus ? Colors.green : Colors.red,
//     fontWeight: FontWeight.bold),
//     )
//     ],
//     ),
//     Row(
//     children: [
//     GestureDetector(
//     onTap: () => deleteFunc(false),
//     child: Container(
//     height: 25,
//     width: 70,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(7),
//     border: Border.all(width: 0.7, color: Colors.black),
//     ),
//     child: Center(
//     child: Text(
//     'Delete',
//     style: TextStyle(
//     color: Colors.red, fontWeight: FontWeight.bold),
//     ),
//     ),
//     ),
//     ),
//     Padding(padding: EdgeInsets.all(7)),
//     ],
//     ),
//     ],
//     ),
//     ],
//     ),
//     // color: Colors.green,
//     height: 190,
//     width: MediaQuery.of(context).size.width,
//     ),
//     )
//     );
//   }
// }
