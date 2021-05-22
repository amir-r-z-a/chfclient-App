import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:flutter/material.dart';

class DetailsCartTile extends StatefulWidget {
  static int j;

  @override
  _DetailsCartTileState createState() => _DetailsCartTileState();
}

class _DetailsCartTileState extends State<DetailsCartTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            children: List.generate(
              ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .cartList[DetailsCartTile.j].cartName.length -
                  1,
              (index)
              {
                print(ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .cartList[DetailsCartTile.j].cartName);
                print((ClientAccounts.accounts[ClientAccounts.currentAccount]
                    .cartList[DetailsCartTile.j].cartSum[index] /
                    ClientAccounts.accounts[ClientAccounts.currentAccount]
                        .cartList[DetailsCartTile.j].cartNum[index])
                    .toString());
                return FinishedClientFoodTile(
                  ClientAccounts.accounts[ClientAccounts.currentAccount]
                      .cartList[DetailsCartTile.j].cartName[index],
                  (ClientAccounts.accounts[ClientAccounts.currentAccount]
                              .cartList[DetailsCartTile.j].cartSum[index] /
                          ClientAccounts.accounts[ClientAccounts.currentAccount]
                              .cartList[DetailsCartTile.j].cartNum[index])
                      .toString(),
                  RestaurantAccounts.restaurantList[0][DetailsCartTile.j]
                      .getCategory(ClientAccounts
                          .accounts[ClientAccounts.currentAccount]
                          .cartList[DetailsCartTile.j]
                          .cartName[index]),
                  desc: RestaurantAccounts.restaurantList[0][DetailsCartTile.j]
                      .getDesc(ClientAccounts
                          .accounts[ClientAccounts.currentAccount]
                          .cartList[DetailsCartTile.j]
                          .cartName[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
