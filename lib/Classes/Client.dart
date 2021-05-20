import 'package:chfclient/Classes/ClientActiveOrderTile.dart';
import 'package:chfclient/Classes/CartTile.dart';
import 'package:chfclient/Classes/ClientOrderHistoryTile.dart';

class Client {
  String _name;
  String _lastName;
  String _phoneNumber;
  List _address;

  // Location _location;
  String _password;
  String _email;
  List<ClientActiveOrderTile> _activeOrders = [];
  List<ClientOrderHistoryTile> _ordersHistory = [];
  Map _cartList = {-1: []};

  // List<Restaurant> _favRestaurants;
  // List<CommentTile> _clientComments;
  double _wallet;

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

  void addOrder(ClientActiveOrderTile clientActiveOrderTile) {
    activeOrders.add(clientActiveOrderTile);
  }

  void addCart(CartTile cartTile, int i) {
    cartList[-1].add(cartTile);
    if (cartList[i] == null) {
      cartList[i] = [];
    }
    cartList[i].add(cartTile);
  }

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

  // List<Restaurant> get favRestaurant => _favRestaurants;
  //
  // set favRestaurant(List<Restaurant> value) {
  //   _favRestaurants = value;
  // }
  //
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
}
