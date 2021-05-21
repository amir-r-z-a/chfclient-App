import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';

class RestaurantAccounts {
  static Map titleRestaurantList = {0: 'All', 1: 'Top Restaurant'};
  static Map restaurantList = {0: []};

  static void receiveRestaurant(RestaurantTile restaurantTile) {
    restaurantList[0].add(restaurantTile);
    //  calculate title
    //  restaurantList[i].add(restaurantTile);
    //  restaurantTile.j= (hame restaurant ha bar asas All sanjide mishavand)
  }
}
