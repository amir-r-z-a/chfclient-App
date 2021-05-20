import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
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

  static int counterCalculator() {
    int sum = 0;
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0]
                .length;
        i++) {
      sum += RestaurantAccounts
          .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
          .clientTabBarView[0][i]
          .counter;
    }
    return sum;
  }

  void cartNumCalculate(Map cartNum) {
    // int sum = 0;
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0]
                .length;
        i++) {
      if (RestaurantAccounts
              .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
              .clientTabBarView[0][i]
              .counter >
          0) {
        cartNum[cartNum.length] = RestaurantAccounts
            .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
            .clientTabBarView[0][i]
            .counter;
        // sum += RestaurantAccounts
        //     .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
        //     .clientTabBarView[0][i]
        //     .counter;
      }
    }
    cartNum[-1] = counterCalculator();
  }

  void cartSumCalculate(Map cartSum) {
    int sum = 0;
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0]
                .length;
        i++) {
      if (RestaurantAccounts
              .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
              .clientTabBarView[0][i]
              .counter >
          0) {
        cartSum[cartSum.length] = RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0][i]
                .counter *
            int.parse(RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0][i]
                .price);
        sum += RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0][i]
                .counter *
            int.parse(RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0][i]
                .price);
      }
    }
    cartSum[-1] = sum;
  }

  void cartNameCalculate(Map cartName) {
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .clientTabBarView[0]
                .length;
        i++) {
      if (RestaurantAccounts
              .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
              .clientTabBarView[0][i]
              .counter >
          0) {
        cartName[cartName.length] = RestaurantAccounts
            .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
            .clientTabBarView[0][i]
            .name;
      }
    }
    cartName[-1] = 'All';
  }

  void goToCartScreen() {
    Map cartSum = {};
    Map cartName = {};
    Map cartNum = {};
    cartSumCalculate(cartSum);
    cartNameCalculate(cartName);
    cartNumCalculate(cartNum);
    CartTile cartTile = CartTile(
        RestaurantAccounts
            .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
            .name,
        RestaurantAccounts
            .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
            .address,
        cartSum,
        cartName,
        cartNum,
        /*RestaurantAccounts
                .restaurantList[DetailsRestaurantTile.i]
                    [DetailsRestaurantTile.j]
                .profileImage,*/
        Date('2021', '3', '12', '4', '22', '23'));
    // RestaurantAccounts
    //     .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j].cart
    //     .add(cartTile);
    ClientAccounts.accounts[ClientAccounts.currentAccount]
        .addCart(cartTile, DetailsRestaurantTile.i);
    Navigator.pushNamed(context, '/CartScreen');
  }

  @override
  Widget build(BuildContext context) {
    DetailsClientFoodTile.goToCartScreen = goToCartScreen;
    DetailsClientFoodTile.counterCalculator = counterCalculator;
    ClientFoodTile.detailsRestaurant = refreshPage;
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
      bottomNavigationBar: counterCalculator() > 0
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () => goToCartScreen(),
                child:
                    Text('Finished (' + counterCalculator().toString() + ')'),
              ),
            )
          : null,
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(children: [
            Padding(padding: EdgeInsets.all(100)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.symmetric(horizontal: BorderSide(width: 0.2))),
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
            ),
          ]),
        ],
      ),
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