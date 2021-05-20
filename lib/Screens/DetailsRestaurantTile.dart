import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantTile extends StatefulWidget {
  static int i;
  static int j;
  static List<bool> controller;
  static int index = 0;

  @override
  _DetailsRestaurantTileState createState() => _DetailsRestaurantTileState();
}

class _DetailsRestaurantTileState extends State<DetailsRestaurantTile> {
  void refreshPage() {
    setState(() {});
  }

  static void changeChip() {
    DetailsRestaurantTile.controller[DetailsRestaurantTile.index] = false;
  }

  @override
  Widget build(BuildContext context) {
    MyTabBarChip.function = refreshPage;
    DetailsRestaurantTile.controller = [];
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .tabBarTitle
                .length;
        i++) {
      DetailsRestaurantTile.controller.add(true);
    }
    changeChip();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Padding(padding: EdgeInsets.all(100)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 0.2))),
            child: Row(
              children: List.generate(
                RestaurantAccounts
                    .restaurantList[DetailsRestaurantTile.i]
                        [DetailsRestaurantTile.j]
                    .tabBarTitle
                    .length,
                (index) {
                  return MyTabBarChip(
                      RestaurantAccounts
                          .restaurantList[DetailsRestaurantTile.i]
                              [DetailsRestaurantTile.j]
                          .tabBarTitle[index],
                      index);
                },
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(
              RestaurantAccounts
                  .restaurantList[DetailsRestaurantTile.i]
                      [DetailsRestaurantTile.j]
                  .clientTabBarView[DetailsRestaurantTile.index]
                  .length,
              (index) => RestaurantAccounts
                  .restaurantList[DetailsRestaurantTile.i]
                      [DetailsRestaurantTile.j]
                  .clientTabBarView[DetailsRestaurantTile.index][index]),
        )
      ]),
    );
  }
}

class MyTabBarChip extends StatefulWidget {
  String label;
  int index;
  static Function function;

  MyTabBarChip(this.label, this.index);

  @override
  _MyTabBarChipState createState() => _MyTabBarChipState();
}

class _MyTabBarChipState extends State<MyTabBarChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.label,
        style: TextStyle(
            color: DetailsRestaurantTile.controller[widget.index]
                ? Colors.black
                : Colors.white),
      ),
      onSelected: (value) {
        setState(() {
          DetailsRestaurantTile.index = widget.index;
          for (int i = 0; i < DetailsRestaurantTile.controller.length; i++) {
            print(DetailsRestaurantTile.controller[i]);
          }
          print(widget.index);
          MyTabBarChip.function();
        });
      },
      backgroundColor: DetailsRestaurantTile.controller[widget.index]
          ? Colors.white10
          : Theme.of(context).primaryColor,
    );
  }
}

//import 'package:chfclient/Classes/RestaurantAccounts.dart';
// import 'package:flutter/material.dart';
//
// class DetailsRestaurantTile extends StatefulWidget {
//   static int i;
//   static int j;
//   static List<bool> controller;
//   static int index = 0;
//
//   @override
//   _DetailsRestaurantTileState createState() => _DetailsRestaurantTileState();
// }
//
// class _DetailsRestaurantTileState extends State<DetailsRestaurantTile> {
//   void refreshPage() {
//     setState(() {});
//   }
//
//   static void changeChip() {
//     DetailsRestaurantTile.controller[DetailsRestaurantTile.index] = /*true;*/
//         !DetailsRestaurantTile.controller[DetailsRestaurantTile.index];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     MyTabBarChip.function = refreshPage;
//     DetailsRestaurantTile.controller = [];
//     for (int i = 0;
//         i <
//             RestaurantAccounts
//                 .restaurantList[DetailsRestaurantTile.i]
//                     [DetailsRestaurantTile.j]
//                 .tabBarTitle
//                 .length;
//         i++) {
//       DetailsRestaurantTile.controller.add(true);
//     }
//     changeChip();
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.symmetric(horizontal: BorderSide(width: 0.2))),
//           child: Row(
//             children: List.generate(
//               RestaurantAccounts
//                   .restaurantList[DetailsRestaurantTile.i]
//                       [DetailsRestaurantTile.j]
//                   .tabBarTitle
//                   .length,
//               (index) {
//                 return MyTabBarChip(
//                     RestaurantAccounts
//                         .restaurantList[DetailsRestaurantTile.i]
//                             [DetailsRestaurantTile.j]
//                         .tabBarTitle[index],
//                     index);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyTabBarChip extends StatefulWidget {
//   String label;
//   int index;
//   static Function function;
//
//   MyTabBarChip(this.label, this.index);
//
//   @override
//   _MyTabBarChipState createState() => _MyTabBarChipState();
// }
//
// class _MyTabBarChipState extends State<MyTabBarChip> {
//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       label: Text(
//         widget.label,
//         style: TextStyle(
//             color: DetailsRestaurantTile.controller[widget.index]
//                 ? Colors.black
//                 : Colors.white),
//       ),
//       onSelected: (value) {
//         setState(() {
//           DetailsRestaurantTile.index = widget.index;
//           for (int i = 0; i < DetailsRestaurantTile.controller.length; i++) {
//             print(DetailsRestaurantTile.controller[i]);
//           }
//           print(widget.index);
//           MyTabBarChip.function();
//         });
//       },
//       backgroundColor: DetailsRestaurantTile.controller[widget.index]
//           ? Colors.white10
//           : Colors.black,
//     );
//   }
// }
