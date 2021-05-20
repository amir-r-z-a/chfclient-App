import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientFoodTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTypes.dart';
import 'package:chfclient/Screens/ClientSignInScreen.dart';
import 'package:chfclient/Screens/ClientSignUpScreen.dart';
import 'package:chfclient/Screens/DetailsClientFoodTile.dart';
import 'package:chfclient/Screens/DetailsRestaurantTile.dart';
import 'package:chfclient/Screens/InvoiceDetailsScreeen.dart';
import 'package:chfclient/Screens/ClientMainMenuScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
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
        '/ClientSignUpScreen': (context) => ClientSignUpScreen(),
        '/ClientSignInScreen': (context) => ClientSignInScreen(),
        '/ClientMainMenuScreen': (context) => ClientMainMenuScreen(),
        '/DetailsClientFoodTile': (context) => DetailsClientFoodTile(),
        '/DetailsRestaurantTile': (context) => DetailsRestaurantTile(),
      },
      home:
          // ClientSignInScreen(),

          // ClientActiveOrderTile()

          //     ClientFoodTile(
          //   'ClientFoodTile1',
          //   '25',
          //   true,
          //   'Cafe',
          //   desc: 'hello',
          // ),

          // ClientOrderTile()

          ClientMainMenuScreen(),

      // InvoiceDetailsScreen()
    );
  }
}

void main() {
  Client client = Client(
    'Client1',
    '09198612878',
    'clientPassword1',
    ['address1', 'address2'],
  );
  ClientAccounts.addAccount(client);
  RestaurantTile restaurant = RestaurantTile(
    'name1',
    'addres1',
    {0: 'All', 1: 'Cafe', 2: 'Fast Food'},
    {
      0: [
        ClientFoodTile(
          'Tea',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Hot Dog',
          '25',
          true,
          'Fast Food',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Milk',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Pizza',
          '25',
          true,
          'Fast Food',
          desc: 'desc',
        ),
      ],
      1: [
        ClientFoodTile(
          'Tea',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Milk',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
      ],
      2: [
        ClientFoodTile(
          'Hot Dog',
          '25',
          true,
          'Fast Food',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Pizza',
          '25',
          true,
          'Fast Food',
          desc: 'desc',
        ),
      ],
    },
    4.3,
    10,
    RestaurantTypes.FastFood,
    {
      0: [
        CommentTile(
            'chera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad bade?',
            'Milk',
            Date('2021', '3', '5', '22', '12', '2'),
            '09121231212',
            '09198612878'),
        CommentTile(
            'chera qazatoon inqad khoobe?',
            'Milk',
            Date('2021', '3', '7', '20', '20', '20'),
            '09121231212',
            '09198612878'),
        CommentTile(
            'chera qazatoon inqad bade va khoobe?',
            'Hot Dog',
            Date('2021', '3', '11', '1', '28', '29'),
            '09121231212',
            '09198612878'),
      ],
      1: [
        CommentTile(
            'chera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad badechera qazatoon inqad bade?',
            'Milk',
            Date('2021', '3', '5', '22', '12', '2'),
            '09121231212',
            '09198612878'),
        CommentTile(
            'chera qazatoon inqad khoobe?',
            'Milk',
            Date('2021', '3', '7', '20', '20', '20'),
            '09121231212',
            '09198612878'),
      ],
      2: [
        CommentTile(
            'chera qazatoon inqad bade va khoobe?',
            'Hot Dog',
            Date('2021', '3', '11', '1', '28', '29'),
            '09121231212',
            '09198612878'),
      ],
    },
    0,
    0,
    // email: 'arman@gmail.com',
  );
  RestaurantAccounts.receiveRestaurant(restaurant);

  RestaurantTile restaurant2 = RestaurantTile(
    'name2',
    'addres2',
    {
      0: 'All',
      1: 'Cafe',
    },
    {
      0: [
        ClientFoodTile(
          'Tea',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Milk',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Juice',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
      ],
      1: [
        ClientFoodTile(
          'Tea',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Milk',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
        ClientFoodTile(
          'Juice',
          '25',
          true,
          'Cafe',
          desc: 'desc',
        ),
      ],
    },
    5.6,
    12,
    RestaurantTypes.Cafe,
    {},
    0,
    1,
    // email: 'arman@gmail.com',
  );
  RestaurantAccounts.receiveRestaurant(restaurant2);

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
