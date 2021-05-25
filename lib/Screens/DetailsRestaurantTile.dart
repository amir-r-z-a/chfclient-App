import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/OrderRegistrationScreen.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantTile extends StatefulWidget {
  static int j;
  static List<bool> controller;
  static int index = 0;

  @override
  _DetailsRestaurantTileState createState() => _DetailsRestaurantTileState();
}

class _DetailsRestaurantTileState extends State<DetailsRestaurantTile> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  static void changeChip() {
    DetailsRestaurantTile.controller[DetailsRestaurantTile.index] = false;
  }

  static int counterCalculator() {
    int sum = 0;
    for (int i = 0;
        i <
            RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
                .clientTabBarView[0].length;
        i++) {
      sum += RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
          .clientTabBarView[0][i].counter;
    }
    return sum;
  }

  // void cartNumCalculate(Map cartNum) {
  //   // int sum = 0;
  //   for (int i = 0;
  //       i <
  //           RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0]
  //               .length;
  //       i++) {
  //     if (RestaurantAccounts
  //             .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //             .clientTabBarView[0][i]
  //             .counter >
  //         0) {
  //       cartNum[cartNum.length] = RestaurantAccounts
  //           .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //           .clientTabBarView[0][i]
  //           .counter;
  //       // sum += RestaurantAccounts
  //       //     .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //       //     .clientTabBarView[0][i]
  //       //     .counter;
  //     }
  //   }
  //   cartNum[-1] = counterCalculator();
  // }
  //
  // void cartSumCalculate(Map cartSum) {
  //   int sum = 0;
  //   for (int i = 0;
  //       i <
  //           RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0]
  //               .length;
  //       i++) {
  //     if (RestaurantAccounts
  //             .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //             .clientTabBarView[0][i]
  //             .counter >
  //         0) {
  //       cartSum[cartSum.length] = RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0][i]
  //               .counter *
  //           int.parse(RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0][i]
  //               .price);
  //       sum += RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0][i]
  //               .counter *
  //           int.parse(RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0][i]
  //               .price);
  //     }
  //   }
  //   cartSum[-1] = sum;
  // }
  //
  // void cartNameCalculate(Map cartName) {
  //   for (int i = 0;
  //       i <
  //           RestaurantAccounts
  //               .restaurantList[DetailsRestaurantTile.i]
  //                   [DetailsRestaurantTile.j]
  //               .clientTabBarView[0]
  //               .length;
  //       i++) {
  //     if (RestaurantAccounts
  //             .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //             .clientTabBarView[0][i]
  //             .counter >
  //         0) {
  //       cartName[cartName.length] = RestaurantAccounts
  //           .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
  //           .clientTabBarView[0][i]
  //           .name;
  //     }
  //   }
  //   cartName[-1] = 'All';
  // }

  void goToOrderRegistration() {
    // Map<int, int> cartSum = {};
    // Map<int, String> cartName = {};
    // Map<int, int> cartNum = {};
    // cartSumCalculate(cartSum);
    // cartNameCalculate(cartName);
    // cartNumCalculate(cartNum);

    // CartTile cartTile = CartTile(
    //     RestaurantAccounts
    //         .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
    //         .name,
    //     RestaurantAccounts
    //         .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j]
    //         .address,
    //     cartSum,
    //     cartName,
    //     cartNum,
    //     /*RestaurantAccounts
    //             .restaurantList[DetailsRestaurantTile.i]
    //                 [DetailsRestaurantTile.j]
    //             .profileImage,*/
    //     Date('2021', '3', '12', '4', '22', '23'),
    //     DetailsRestaurantTile.j);

    // RestaurantAccounts
    //     .restaurantList[DetailsRestaurantTile.i][DetailsRestaurantTile.j].cart
    //     .add(cartTile);

    // ClientAccounts.accounts[ClientAccounts.currentAccount].addCart(cartTile);
    OrderRegistrationScreen.j = DetailsRestaurantTile.j;
    ClientAccounts
        .accounts[ClientAccounts.currentAccount]
        .cartList[DetailsRestaurantTile.j]
        .cartFoods = List<FinishedClientFoodTile>();
    for (int i = 0;
        i <
            ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .cartList[DetailsRestaurantTile.j]
                    .getCartNameLength() -
                1;
        i++) {
      ClientAccounts.accounts[ClientAccounts.currentAccount]
          .cartList[DetailsRestaurantTile.j].cartFoods
          .add(FinishedClientFoodTile(
        ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[DetailsRestaurantTile.j].cartName[i],
        (ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .cartList[DetailsRestaurantTile.j].cartSum[i] /
                ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .cartList[DetailsRestaurantTile.j].cartNum[i])
            .toString(),
        ClientAccounts.accounts[ClientAccounts.currentAccount]
            .cartList[DetailsRestaurantTile.j].cartNum[i],
        RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
            .getCategory(ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[DetailsRestaurantTile.j].cartName[i]),
        desc: RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
            .getDesc(ClientAccounts.accounts[ClientAccounts.currentAccount]
                .cartList[DetailsRestaurantTile.j].cartName[i]),
      ));
    }
    Navigator.pushNamed(context, '/DetailsCartTile');
  }

  @override
  Widget build(BuildContext context) {
    OrderRegistrationScreen.detailsRestaurant = refreshPage;
    DetailsClientFoodTile.goToOrderRegistration = goToOrderRegistration;
    DetailsClientFoodTile.counterCalculator = counterCalculator;
    ClientFoodTile.detailsRestaurant = refreshPage;
    MyTabBarChip.function = refreshPage;
    DetailsRestaurantTile.controller = [];
    for (int i = 0;
        i <
            RestaurantAccounts
                .restaurantList[0][DetailsRestaurantTile.j].tabBarTitle.length;
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
                onPressed: () => goToOrderRegistration(),
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
                        .restaurantList[0][DetailsRestaurantTile.j]
                        .tabBarTitle
                        .length,
                    (index) {
                      return MyTabBarChip(
                          RestaurantAccounts
                              .restaurantList[0][DetailsRestaurantTile.j]
                              .tabBarTitle[index],
                          index);
                    },
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                  RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j]
                      .clientTabBarView[DetailsRestaurantTile.index].length,
                  (index) => RestaurantAccounts
                      .restaurantList[0][DetailsRestaurantTile.j]
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
