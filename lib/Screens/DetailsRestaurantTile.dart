import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:flutter/material.dart';

class DetailsRestaurantTile extends StatefulWidget {
  static int i;
  static int j;
  static List<MyTabBarChip> chipList;

  static void offOtherChip(int index) {
    for (int i = 0; i < DetailsRestaurantTile.chipList.length; i++) {
      if (i != index) {
        DetailsRestaurantTile.chipList[i].flag = false;
      }
    }
  }

  @override
  _DetailsRestaurantTileState createState() => _DetailsRestaurantTileState();
}

class _DetailsRestaurantTileState extends State<DetailsRestaurantTile> {
  void refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // MyTabBarChip.detailsRestaurantTile = refreshPage;
    setState(() {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
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
                  MyTabBarChip myTabBarChip = MyTabBarChip(
                      RestaurantAccounts
                          .restaurantList[DetailsRestaurantTile.i]
                              [DetailsRestaurantTile.j]
                          .tabBarTitle[index],
                      DetailsRestaurantTile.chipList.length);
                  DetailsRestaurantTile.chipList.add(myTabBarChip);
                  return myTabBarChip;
                },
              ),
            ),
          ),
        ),
      );
    });
  }

// Widget MyTabBarChip(String label) {
//   bool flag = true;
//   return FilterChip(
//     label: Text(DetailsRestaurantTile.flag ? label : 'hi'),
//     onSelected: (value) {
//       setState(() {
//         DetailsRestaurantTile.flag = !DetailsRestaurantTile.flag;
//       });
//     },
//     backgroundColor:
//         DetailsRestaurantTile.flag ? Colors.white10 : Colors.black,
//   );
// }
}

class MyTabBarChip extends StatefulWidget {
  bool flag = true;
  String label;

  // static Function detailsRestaurantTile;

  int index;

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
        style: TextStyle(color: widget.flag ? Colors.black : Colors.white),
      ),
      onSelected: (value) {
        setState(() {
          widget.flag = !widget.flag;
          DetailsRestaurantTile.offOtherChip(widget.index);
          // MyTabBarChip.detailsRestaurantTile();
        });
      },
      backgroundColor: widget.flag ? Colors.white10 : Colors.black,
    );
  }
}
