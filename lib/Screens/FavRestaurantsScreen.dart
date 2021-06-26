import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavRestaurantsScreen extends StatefulWidget {
  @override
  _FavRestaurantsScreenState createState() => _FavRestaurantsScreenState();
}

class _FavRestaurantsScreenState extends State<FavRestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Image.asset(
          "assets/images/back.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            centerTitle: true,
            title: Text('Fav Restaurant'),
          ),
          body: ListView(
            children: [
              // Text(
              //   'Fav Restaurant',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              // ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      ClientAccounts.accounts[ClientAccounts.currentAccount]
                          .getFavRestaurantsLength(),
                          (index) => ClientAccounts
                          .accounts[ClientAccounts.currentAccount]
                          .favRestaurants[index]),
                ),
              )
            ],
          ),
        ),
      ]
    );
  }
}
