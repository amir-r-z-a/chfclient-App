import 'dart:math';

import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientAdreesTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:latlong/latlong.dart';

class Client {
  String _name;

  // String _lastName;
  String _phoneNumber;
  List<ClientAddressTile> _address = [];
  int currentAddress = 0;
  LatLng currentLocation;
  String _password;
  String _email;
  List<ClientActiveOrderTile> _activeOrders = [];
  List<ClientOrderHistoryTile> _ordersHistory = [];
  Map _cartList = {-1: []};
  List<RestaurantTile> _favRestaurants = [];
  List<bool> _favRestaurantsKey = [];
  List<CommentTile> _clientComments = [];
  double _wallet = 0;
  Date _lastIncrease;

  Client(
    this._name,
    this._phoneNumber,
    this._password,
    // String address,
  ) {
    // addAddress(address);
    for (int i = 0; i < RestaurantAccounts.getRestaurantListLength(); i++) {
      print('--------------------------------------');
      print('-------------------------------------');
      print('------------------------------------');
      print('-----------------------------------');
      print("false add to favKey");
      print('--------------------------------------');
      favRestaurantsKey.add(false);
    }
  }

  bool isInRange(LatLng restaurant, double restaurantRange) {
    double x = sqrt(pow(
            (restaurant.latitude - _address[currentAddress].location.latitude),
            2) +
        pow(
            (restaurant.longitude -
                _address[currentAddress].location.longitude),
            2));
    print("x is: " + x.toString());
    print("range is: " + restaurantRange.toString());
    if (x > restaurantRange) {
      return false;
    } else {
      return true;
    }
  }

  int getOrdersHistoryLength() {
    return ordersHistory.length;
  }

  int getActiveOrdersLength() {
    return activeOrders.length;
  }

  int getCartListLength() {
    return cartList.length;
  }

  int getAddressLength() {
    return address.length;
  }

  int getFavRestaurantsLength() {
    return favRestaurants.length;
  }

  int getClientCommentsLength() {
    return clientComments.length;
  }

  void addOrder(ClientActiveOrderTile clientActiveOrderTile) {
    activeOrders.add(clientActiveOrderTile);
  }

  void addCart(CartTile cartTile) {
    if (cartList[cartTile.j] == null) {
      cartList[-1].add(cartTile);
      cartList[cartTile.j] = cartTile;
    }
  }

  void removeCart(int j) {
    cartList.remove(j);
    for (int i = 0; i < cartList[-1].length; i++) {
      if (cartList[-1][i].j == j) {
        cartList[-1].removeAt(i);
      }
    }
    RestaurantAccounts.zeroNumberOfFoods(j);
  }

  void newCart(int j) {
    CartTile cartTile = CartTile(
        RestaurantAccounts.restaurantList[0][j].name,
        RestaurantAccounts.restaurantList[0][j].address,
        {-1: 0},
        {-1: 'All'},
        {-1: 0},
        Date(/*'2021', '3', '12', '4', '22', '23'*/),
        j);
    cartList[j] = cartTile;
    for (int i = 0; i < cartList[-1].length; i++) {
      if (cartList[-1][i].j == j) {
        cartList[-1][i] = cartTile;
      }
    }
    RestaurantAccounts.zeroNumberOfFoods(j);
  }

  void addComment(CommentTile commentTile) {
    clientComments.add(commentTile);
  }

  static bool validWallet(String input) {
    //^([1-9][0-9]*)|([1-9][0-9]*\\.[0-9]+)$
    RegExp regPrice = new RegExp(
        r'^((\d{1,3}|\s*){1})((\,\d{3}|\d)*)(\s*|\.(\d{2}))$',
        caseSensitive: false,
        multiLine: false);
    if (!regPrice.hasMatch(input)) {
      return true;
    }
    return false;
  }

  bool validPayment(double sumPrice) {
    bool ans = wallet >= sumPrice;
    if (ans) {
      minusWallet(sumPrice);
    }
    return ans;
  }

  void addWallet(double credit) {
    wallet += credit;
  }

  void minusWallet(double credit) {
    wallet -= credit;
  }

  void changeLastIncrease(Date date) {
    lastIncrease = date;
  }

  void addAddress(String input, LatLng location) {
    address.add(ClientAddressTile(input, getAddressLength(), location));
    ClientMyTextFormField.location = null;
  }

  void refreshAllAddress() {
    for (int i = 0; i < getAddressLength(); i++) {
      address[i].refreshPage();
    }
  }

  void deleteAddress(int index) {
    if (index < currentAddress ||
        (!(getAddressLength() == 1 && index == 0 && currentAddress == 0) &&
            (currentAddress == index && index == getAddressLength() - 1))) {
      currentAddress--;
    }
    address.removeAt(index);
    for (int i = index; i < getAddressLength(); i++) {
      address[i].index--;
    }
  }

  void editAddress(String input, int index) {
    address[index].address = input;
  }

  // void refreshAllRestaurantTile() {
  //   for (int i = 0; i < getFavRestaurantsLength(); i++) {
  //     favRestaurants[i].refreshPage();
  //   }
  // }

  // List<bool> createFavRestaurant() {
  //   List<bool> list = [];
  //   for (int i = 0; i < RestaurantAccounts.getRestaurantListLength(); i++) {
  //     list.add(false);
  //   }
  //   return list;
  // }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  // String get lastName => _lastName;
  //
  // set lastName(String value) {
  //   _lastName = value;
  // }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  // Location get location => _location;
  //
  // set location(Location value) {
  //   _location = value;
  // }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  List<RestaurantTile> get favRestaurants => _favRestaurants;

  set favRestaurants(List<RestaurantTile> value) {
    _favRestaurants = value;
  }

  // List<CommentTile> get clientComments => _clientComments;
  //
  // set clientComments(List<CommentTile> value) {
  //   _clientComments = value;
  // }

  double get wallet => _wallet;

  set wallet(double value) {
    _wallet = value;
  }

  List get address => _address;

  set address(List value) {
    _address = value;
  }

  List<ClientOrderHistoryTile> get ordersHistory => _ordersHistory;

  set ordersHistory(List<ClientOrderHistoryTile> value) {
    _ordersHistory = value;
  }

  List<ClientActiveOrderTile> get activeOrders => _activeOrders;

  set activeOrders(List<ClientActiveOrderTile> value) {
    _activeOrders = value;
  }

  Map get cartList => _cartList;

  set cartList(Map value) {
    _cartList = value;
  }

  List<bool> get favRestaurantsKey => _favRestaurantsKey;

  set favRestaurantsKey(List<bool> value) {
    _favRestaurantsKey = value;
  }

  List<CommentTile> get clientComments => _clientComments;

  set clientComments(List<CommentTile> value) {
    _clientComments = value;
  }

  Date get lastIncrease => _lastIncrease;

  set lastIncrease(Date value) {
    _lastIncrease = value;
  }
}
