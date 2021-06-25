import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientHomeScreen extends StatefulWidget {
  static Function restaurantTile;

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  void refreshPage() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,  "/IranianFoodsScreen" ) ;
                },
                child: Container(
                  child: Image.network("https://digifood.ir/wp-content/uploads/2020/12/soltani.jpg"),
                  height: 100,
                  width:80,
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,  "/FastFoodScreen" ) ;
                },
                child: Container(
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4nyMpyiAVZ0mqVIgJ-aFEJi3Af53q5sqcXQ&usqp=CAU"),
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,  "/CafesScreen" ) ;
                },
                child: Container(
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoNKCU2PWHnPwlHO1Os0nkCZYkMcng8inEcA&usqp=CAU"),
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,  "/OthersScreen" ) ;
                },
                child: Container(
                  child: Image.network("https://images.theconversation.com/files/159486/original/image-20170306-933-1nay8fl.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip"),
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Restaurants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/MorePopularRestaurantsScreen");
                  },
                  child: Text(
                    'more',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(RestaurantAccounts.restaurantList[0].length,
                (index) {
                  if(RestaurantAccounts.restaurantList[0][index].point > 4 )
                  {
                    return RestaurantAccounts.restaurantList[0][index];
                  }
                  return Container(height: 0,width: 0,);
              // if (ClientHomeScreen.restaurantTile != null) {
              //   ClientHomeScreen.restaurantTile();
              // }
              // return RestaurantAccounts.restaurantList[0][index];
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearest Restaurants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(RestaurantAccounts.restaurantList[0].length,
                    (index) {
                  // if (ClientHomeScreen.restaurantTile != null) {
                  //   ClientHomeScreen.restaurantTile();
                  // }
                  if (RestaurantAccounts.restaurantList[0][index].refreshPage !=
                      null) {
                    // RestaurantAccounts.restaurantList[0][index].refreshPage();
                  }
                  return RestaurantAccounts.restaurantList[0][index];
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Restaurants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(RestaurantAccounts.restaurantList[0].length,
                    (index) {
                  // if (ClientHomeScreen.restaurantTile != null) {
                  //   ClientHomeScreen.restaurantTile();
                  // }
                  if (RestaurantAccounts.restaurantList[0][index].refreshPage !=
                      null) {
                    // RestaurantAccounts.restaurantList[0][index].refreshPage();
                  }
                  return RestaurantAccounts.restaurantList[0][index];
                }),
          ),
        ),
      ],
    );
  }
}
