import 'dart:io';

import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Screens/OrderRegistrationScreen.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
import 'package:chfclient/main.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            RestaurantAccounts.restaurantList[0][DetailsRestaurantTile.j].name),
      ),
      body: ListView(
        children: [
          Column(children: [
            Container(
              // height: 200,
              // width: 200,
              child: Image.asset("assets/images/1.jpg"),
            ),
            // Padding(padding: EdgeInsets.all(100)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border:
                        Border.symmetric(horizontal: BorderSide(width: 0.2))),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: 450,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        "Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                  Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(-8, 10),
                                            blurRadius: 18,
                                            spreadRadius: 8,
                                          ),
                                        ],
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          RestaurantAccounts
                                              .restaurantList[0]
                                                  [DetailsRestaurantTile.j]
                                              .point
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      RestaurantAccounts
                                          .restaurantList[0]
                                              [DetailsRestaurantTile.j]
                                          .address,
                                      maxLines: 3,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "From  " +
                                          RestaurantAccounts
                                              .restaurantList[0]
                                                  [DetailsRestaurantTile.j]
                                              .startingTime +
                                          "  to  " +
                                          RestaurantAccounts
                                              .restaurantList[0]
                                                  [DetailsRestaurantTile.j]
                                              .endingTime,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        String listen = '';
                                        await Socket.connect(MyApp.ip, 2442)
                                            .then((serverSocket) {
                                          print('connected writer');
                                          String write =
                                              'Comments-RestaurantComments-' +
                                                  RestaurantAccounts
                                                      .restaurantList[0][
                                                          DetailsRestaurantTile
                                                              .j]
                                                      .phoneNumber;
                                          write =
                                              (write.length + 7).toString() +
                                                  ',Client-' +
                                                  write;
                                          serverSocket.write(write);
                                          serverSocket.flush();
                                          print('write: ' + write);
                                          print('connected listen');
                                          serverSocket.listen((socket) {
                                            listen =
                                                String.fromCharCodes(socket)
                                                    .trim()
                                                    .substring(2);
                                          }).onDone(() {
                                            print("listen: " + listen);
                                            if (listen != null &&
                                                listen.isNotEmpty) {
                                              // Map test = {0: []};
                                              // for (int u = 1;
                                              // u <
                                              //     RestaurantAccounts
                                              //         .restaurantList[0][DetailsRestaurantTile.j]
                                              //         .restaurantComments
                                              //         .length;
                                              // u++) {
                                              //   test[u] = [];
                                              // }
                                              RestaurantAccounts
                                                  .restaurantList[0]
                                                      [DetailsRestaurantTile.j]
                                                  .restaurantComments = [];
                                              List<String> comments =
                                                  listen.split('\n');
                                              for (int i = 0;
                                                  i < comments.length;
                                                  i++) {
                                                List<String> commentElements =
                                                    comments[i].split(', ');
                                                // int index = 0;
                                                // for (int j = 1;
                                                // j <
                                                //     Accounts
                                                //         .accounts[Accounts.currentAccount]
                                                //         .restaurantTabBarView
                                                //         .length;
                                                // j++) {
                                                //   for (int k = 0;
                                                //   k <
                                                //       Accounts
                                                //           .accounts[
                                                //       Accounts.currentAccount]
                                                //           .restaurantTabBarView[j]
                                                //           .length;
                                                //   k++) {
                                                //     if (Accounts
                                                //         .accounts[Accounts.currentAccount]
                                                //         .restaurantTabBarView[j][k]
                                                //         .name ==
                                                //         commentElements[3]) {
                                                //       index = j;
                                                //     }
                                                //   }
                                                // }
                                                List<String> dateElements =
                                                    commentElements[5]
                                                        .split(':');
                                                Date date = Date(
                                                    year: dateElements[0]
                                                        .substring(
                                                            dateElements[0]
                                                                    .indexOf(
                                                                        '(') +
                                                                1),
                                                    month: dateElements[1],
                                                    day: dateElements[2],
                                                    hour: dateElements[3],
                                                    minute: dateElements[4],
                                                    second: dateElements[5]
                                                        .substring(
                                                            0,
                                                            dateElements[5]
                                                                .indexOf(')')));
                                                // print('index is: ' + index.toString());
                                                for (int y = 0;
                                                    y < commentElements.length;
                                                    y++) {
                                                  print("element is: " +
                                                      commentElements[y]);
                                                }
                                                RestaurantAccounts
                                                    .restaurantList[0][
                                                        DetailsRestaurantTile.j]
                                                    .restaurantComments
                                                    .add(CommentTile(
                                                  commentElements[1],
                                                  commentElements[3],
                                                  date,
                                                  commentElements[0].substring(
                                                      0,
                                                      commentElements[0]
                                                          .indexOf(':')),
                                                  commentElements[4],
                                                  answer: (commentElements[2] ==
                                                          'null'
                                                      ? ''
                                                      : commentElements[2]),
                                                ));
                                              }
                                            }
                                            Navigator.pushNamed(
                                                context, "/AllCommentsScreen");
                                          });
                                          // serverSocket.close();
                                        });
                                      },
                                      child: Container(
                                          width: 170,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xffbcece0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: const Offset(-8, 10),
                                                blurRadius: 18,
                                                spreadRadius: 8,
                                              ),
                                            ],
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              " Show Comments ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
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
                  ],
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
