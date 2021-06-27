import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';

class RestaurantAccounts {
  static Map titleRestaurantList = {
    0: 'All',
    1: 'Popular Restaurants',
    2: 'Nearest Restaurants'
  };
  static Map<int, List<RestaurantTile>> restaurantList = {0: []};

  static int getRestaurantListLength() {
    return restaurantList[0].length;
  }

  static void receiveRestaurant(RestaurantTile restaurantTile) {
    print('im in restaurant add');
    print(restaurantList[0].length);
    restaurantList[0].add(restaurantTile);
    print(restaurantList[0].length);
    print('bye');
    //  calculate title
    //  restaurantList[i].add(restaurantTile);
    //  restaurantTile.j= (hame restaurant ha bar asas All sanjide mishavand)
  }

  static void zeroNumberOfFoods(int j) {
    for (int i = 0; i < restaurantList[0][j].clientTabBarView[0].length; i++) {
      restaurantList[0][j].clientTabBarView[0][i].counter = 0;
    }
  }
}
