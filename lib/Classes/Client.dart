import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';
import 'package:chfclient/Classes/RestaurantAccounts.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Common%20Classes/Date.dart';
import 'package:chfclient/Common/Common%20Classes/RestaurantTile.dart';

class Client {
  String _name;
  String _lastName;
  String _phoneNumber;
  List _address;
  int currentAddress = 0;

  // Location _location;
  String _password;
  String _email;
  List<ClientActiveOrderTile> _activeOrders = [];
  List<ClientOrderHistoryTile> _ordersHistory = [];
  Map _cartList = {-1: []};
  List<RestaurantTile> _favRestaurants = [];
  List<bool> _favRestaurantsKey = [];
  List<CommentTile> _clientComments = [];
  double _wallet = 0;
  Date lastIncrease;

  Client(
    this._name,
    this._phoneNumber,
    this._password,
    this._address,
  );

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

  void addWallet(double credit) {
    wallet += credit;
  }

  void minusWallet(double credit) {
    wallet -= credit;
  }

  void changeLastIncrease(Date date) {
    lastIncrease = date;
  }

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

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

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
  } // List<CommentTile> get clientComments => _clientComments;
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
}
