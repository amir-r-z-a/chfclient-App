import 'dart:ffi';

import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';
import 'package:chfclient/Classes/FinishedClientFoodTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfclient/Screens/CafesScreen.dart';
import 'package:chfclient/Screens/CartScreen.dart';
import 'package:chfclient/Screens/ClientActiveOrdersScreen.dart';
import 'package:chfclient/Screens/ClientDetailsCommentTile.dart';
import 'package:chfclient/Screens/ClientSignInScreen.dart';
import 'package:chfclient/Screens/ClientSignUpScreen.dart';
import 'package:chfclient/Screens/CommentsScreen.dart';
import 'package:chfclient/Screens/ContactUsScreen.dart';
import 'package:chfclient/Screens/FastFoodScreen.dart';
import 'package:chfclient/Screens/FavRestaurantsScreen.dart';
import 'package:chfclient/Screens/IranianFoodsScreen.dart';
import 'package:chfclient/Screens/MorePopularRestaurantsScreen.dart';
import 'package:chfclient/Screens/OrderRegistrationScreen.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/Screens/InvoiceDetailsScreeen.dart';
import 'package:chfclient/Screens/ClientMainMenuScreen.dart';
import 'package:chfclient/Screens/OthersScreen.dart';
import 'package:chfclient/Screens/PaymentAddressesScreen.dart';
import 'package:chfclient/Screens/PaymentScreen.dart';
import 'package:chfclient/Screens/ClientProfileScreen.dart';
import 'package:chfclient/Screens/SplashScreen.dart';
import 'package:chfclient/Screens/WalletScreen.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';

import 'Screens/ClientActiveOrderTileScreen.dart';

class MyApp extends StatefulWidget {
  static String ip = '172.20.10.2';
  static String id = '';
  static String mode = 'LogOut';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CHFood",
      theme: ThemeData(primaryColor: const Color.fromRGBO(248, 95, 106, 1)),
      routes: {
        '/ClientActiveOrderTileScreen': (context) =>
            ClientActiveOrderTileScreen(),
        '/MorePopularRestaurantsScreen': (context) =>
            MorePopularRestaurantsScreen(),
        '/CafesScreen': (context) => CafesScreen(),
        '/ContactUsScreen': (context) => ContactUsScreen(),
        '/OthersScreen': (context) => OthersScreen(),
        '/FastFoodScreen': (context) => FastFoodScreen(),
        '/IranianFoodsScreen': (context) => IranianFoodsScreen(),
        '/ClientSignUpScreen': (context) => ClientSignUpScreen(),
        '/ClientSignInScreen': (context) => ClientSignInScreen(),
        '/ClientMainMenuScreen': (context) => ClientMainMenuScreen(),
        '/DetailsClientFoodTile': (context) => DetailsClientFoodTile(),
        '/DetailsRestaurantTile': (context) => DetailsRestaurantTile(),
        '/DetailsCartTile': (context) => OrderRegistrationScreen(),
        '/PaymentScreen': (context) => PaymentScreen(),
        '/FavRestaurantsScreen': (context) => FavRestaurantsScreen(),
        '/ProfileScreen': (context) => ClientProfileScreen(),
        '/CommentsScreen': (context) => CommentsScreen(),
        '/ClientDetailsCommentTile': (context) => ClientDetailsCommentTile(),
        '/WalletScreen': (context) => WalletScreen(),
        '/ClientActiveOrdersScreen': (context) => ClientActiveOrdersScreen(),
        '/PaymentAddressesScreen': (context) => PaymentAddressesScreen(),
      },
      home: ContactUsScreen(),

      // ClientActiveOrderTile()

      //     ClientFoodTile(
      //   'ClientFoodTile1',
      //   '25',
      //   true,
      //   'Cafe',
      //   desc: 'hello',
      // ),

      // ClientOrderTile()

      // ClientActiveOrderTile()

      // ClientMainMenuScreen(),
// SplashScreen()
      //     FinishedClientFoodTile(
      //   'Tea',
      //   '25',
      //   'Cafe',
      //   desc: 'desc',
      // ),

      // InvoiceDetailsScreen()
    );
  }
}

void main() {
  String msg = "09198612878:12345678: {, question1, answer1, phoneNumberRes, foodName, Date(2021:12:01:12:13:1), destinationRestaurant, }" ;
  List <String> msg1 = msg.split("\n");
  for( var i = 0 ; i < msg1.length ;i++ ){
    List <String> msg2 = msg1[i].split(", ") ;
    String question = msg2[1] ;
    String ID = msg2[0].substring(msg2[0].indexOf(":")+1,msg2[0].indexOf("{")-2);
    String ClientPhonNumber = msg1[i].substring(0,11);
    String Answer = msg2[2] ;
    String restaurantNumber = msg2 [3];
    String foodname =  msg2[4];
    List <String> date  = msg2[5].split(":");
    String Year = date[0].substring(date[0].indexOf("(")+1);
    String Month = date[1];
    String Day = date[2];
    String hour = date[3];
    String minute = date[4];
    String second = date[5];
    String destinationRes = msg2[6];
  }
  // String restaurantAccounts =
  //     "09198612878: {, arman, arman123, 03:10, 22:55, Other, ahmafi@gmail.com, address44, LatLng(latitude:35.743649:::longitude:51.427343), 10, 1.1, 1, }";
  // //09198612878: {, arman, arman123, 03:10, 22:55, Other, ahmafi@gmail.com, address44, LatLng(latitude:35.743649:::longitude:51.427343), 10, 1.1, j, }
  // String m ="09198612878: {, address, LatLng(latitude:35.743649:::longitude:51.427343)}";
  // List z = m.split(", ");
  // String add = z[1];
  // String latitude = z[2]
  //     .substring(z[2].indexOf(':') + 1, z[2].indexOf(':::'));
  // String longitude = z[2].substring(
  //     z[2].lastIndexOf(':') + 1,z[2].indexOf(')'));
  // LatLng latLng = LatLng(double.parse(latitude), double.parse(longitude));
  // print(add) ;
  // print(m.substring(0,11));
  // print(z);
  // print(restaurantAccounts.substring(0, 11));
  // List x = [];
  // x = restaurantAccounts.split(", ");
  // print(x);
  // String name = x[1];
  // String startTime = x[3];
  // String endTime = x[4];
  // String type = x[5];
  // String mail = x[6];
  // String address = x[7];
  // String latlong = x[8];
  // String lat = latlong.substring(16, 25);
  // String lon = latlong.substring(38, 47);
  // print(lat);
  // print(lon);
  // var la = double.parse(lat);
  // var lo = double.parse(lon);
  // int Radius = int.parse(x[9]);
  // double point = double.parse(x[10]);
  // LatLng Loacation = LatLng(la, lo);
  // int Index = int.parse(x[9]);
  // ClientAddressTile.trailing = false;

  //
  // ClientFoodTile Tea1 = ClientFoodTile(
  //   'tea',
  //   '25',
  //   true,
  //   'cafe',
  //   desc: 'aaa',
  // );
  // ClientFoodTile HotDog1 = ClientFoodTile(
  //   'HotDog',
  //   '12',
  //   true,
  //   'FastFood',
  //   desc: 'hot dog is good',
  // );
  // ClientFoodTile Milk1 = ClientFoodTile(
  //   'milk',
  //   '20',
  //   true,
  //   'cafe',
  // );
  //
  // ClientFoodTile Pizza1 = ClientFoodTile(
  //   'Pizza',
  //   '25',
  //   true,
  //   'Fast Food',
  //   desc: 'desc',
  // );
  //
  // CommentTile comment11 = CommentTile(
  //     'chera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad bade?',
  //     'Milk',
  //     Date(/*'2021', '3', '5', '22', '12', '2'*/),
  //     '09121231212',
  //     '09198612878');
  // CommentTile comment12 = CommentTile(
  //     'chera qazatoon inqad khoobe?',
  //     'Milk',
  //     Date(/*'2021', '3', '7', '20', '20', '20'*/),
  //     '09121231212',
  //     '09198612878');
  // CommentTile comment13 = CommentTile(
  //     'chera qazatoon inqad bade va khoobe?',
  //     'Hot Dog',
  //     Date(/*'2021', '3', '11', '1', '28', '29'*/),
  //     '09121231212',
  //     '09198612878');
  // RestaurantTile restaurant = RestaurantTile(
  //   'arman',
  //   'Iran, Tehran, Pasdaran, Khiaban Bahar Qarbi, Kooche Mehr, 1111',
  //   '09198612878',
  //   {0: 'All', 1: 'cafe', 2: 'FastFood'},
  //   {
  //     0: [
  //       Tea1,
  //       Milk1,
  //       HotDog1,
  //       // Pizza1,
  //     ],
  //     1: [
  //       Tea1,
  //       Milk1,
  //     ],
  //     2: [
  //       HotDog1,
  //       // Pizza1,
  //     ],
  //   },
  //   1.1,
  //   19,
  //   RestaurantTypes.FastFood,
  //   {
  //     0: [
  //       comment11,
  //       comment12,
  //       comment13,
  //     ],
  //     1: [
  //       comment11,
  //       comment12,
  //     ],
  //     2: [
  //       comment13,
  //     ],
  //   },
  //   LatLng(35.742679, 51.39983),
  //   0,
  //   "email1",
  //   "00:12",
  //   "23:49",
  // );
  // RestaurantAccounts.receiveRestaurant(restaurant);
  //
  // RestaurantTile restaurant3 = RestaurantTile(
  //   'name3',
  //   'Iran, Tehran, Pasdaran, Khiaban Bahar Qarbi, Kooche Mehr, 1111',
  //   '09198612878',
  //   {0: 'All', 1: 'Cafe', 2: 'Fast Food'},
  //   {
  //     0: [
  //       Tea1,
  //       HotDog1,
  //       Milk1,
  //       Pizza1,
  //     ],
  //     1: [
  //       Tea1,
  //       Milk1,
  //     ],
  //     2: [
  //       HotDog1,
  //       Pizza1,
  //     ],
  //   },
  //   4.3,
  //   10,
  //   RestaurantTypes.IranianRestaurant,
  //   {
  //     0: [
  //       comment11,
  //       comment12,
  //       comment13,
  //     ],
  //     1: [
  //       comment11,
  //       comment12,
  //     ],
  //     2: [
  //       comment13,
  //     ],
  //   },
  //   LatLng(35.725295, 51.400957),
  //   1,
  //   'arman@gmail.com',
  //   "8:00",
  //   "22:00",
  // );
  // RestaurantAccounts.receiveRestaurant(restaurant3);
  //
  // ClientFoodTile Tea2 = ClientFoodTile(
  //   'Tea',
  //   '25',
  //   true,
  //   'Cafe',
  //   desc: 'desc',
  // );
  // ClientFoodTile Milk2 = ClientFoodTile(
  //   'Milk',
  //   '25',
  //   true,
  //   'Cafe',
  //   desc: 'desc',
  // );
  // ClientFoodTile Juice2 = ClientFoodTile(
  //   'Juice',
  //   '25',
  //   true,
  //   'Cafe',
  //   desc: 'desc',
  // );
  // RestaurantTile restaurant2 = RestaurantTile(
  //   'name2',
  //   'addres2',
  //   '09121111111',
  //   {
  //     0: 'All',
  //     1: 'Cafe',
  //   },
  //   {
  //     0: [
  //       Tea2,
  //       Milk2,
  //       Juice2,
  //     ],
  //     1: [
  //       Tea2,
  //       Milk2,
  //       Juice2,
  //     ],
  //   },
  //   5.6,
  //   12,
  //   RestaurantTypes.Cafe,
  //   {},
  //   LatLng(35.742894, 51.423224),
  //   2,
  //   // email: 'arman@gmail.com',
  //   "email2",
  //   "9:00",
  //   "18:00",
  // );
  // RestaurantAccounts.receiveRestaurant(restaurant2);
  //
  // RestaurantTile restaurant4 = RestaurantTile(
  //   'name4',
  //   'addres2',
  //   '09121111111',
  //   {
  //     0: 'All',
  //     1: 'Cafe',
  //   },
  //   {
  //     0: [
  //       Tea2,
  //       Milk2,
  //       Juice2,
  //     ],
  //     1: [
  //       Tea2,
  //       Milk2,
  //       Juice2,
  //     ],
  //   },
  //   5.6,
  //   12,
  //   RestaurantTypes.Other,
  //   {},
  //   LatLng(35.742894, 51.423224),
  //   3,
  //   'armannn@gmail.com',
  //   "12:00",
  //   "23:00",
  // );
  // RestaurantAccounts.receiveRestaurant(restaurant4);
  // ClientMainMenuScreen.res.add(restaurant4);
  // ClientMainMenuScreen.res.add(restaurant);
  // ClientMainMenuScreen.res.add(restaurant3);
  // ClientMainMenuScreen.res.add(restaurant2);
  // Client client = Client(
  //   'Client1',
  //   '09198612877',
  //   'clientPassword1',
  // );
  // client.addAddress(
  //   'Iran Tehran Gisha',
  //   LatLng(35.722629, 51.410471),
  // );


  //
  // ClientAccounts.addAccount(client);
  // client.addAddress('address2', LatLng(35.72247, 51.398161));
  runApp(MyApp());
}

//Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               decoration: BoxDecoration(
//                   border: Border.symmetric(horizontal: BorderSide(width: 0.2))),
//               child: Row(children: [
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//                 FilterChip(
//                   label: Text(
//                     'chip',
//                   ),
//                   backgroundColor: Colors.white10,
//                   onSelected: (bool value) {},
//                 ),
//               ]),
//             ),
//           ),
//         ),
//       ),
