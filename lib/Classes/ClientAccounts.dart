import 'dart:math';

import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/Request.dart';
import 'package:chfclient/Common/Common%20Classes/CommentTile.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';

class ClientAccounts {
  static List<Client> _accounts = List.empty(growable: true);
  static int _currentAccount = 0;
  static bool key = false;

//edit

  static List<Client> get accounts => _accounts;

  static set accounts(List<Client> value) {
    _accounts = value;
  }

  static int get currentAccount => _currentAccount;

  static set currentAccount(int value) {
    _currentAccount = value;
  }

  static Client addAccount(Client client) {
    if (!key) {
      Request.writerListener('ClientSignUp-' +
          client.name +
          '-' +
          client.phoneNumber +
          '-' +
          client.password);
    }
    if (key) {
      accounts.add(client);
    }
    print("A: " + accounts.toString());
    return client;
  }

  static int getClientAccountsLength() {
    return _accounts.length;
  }

  static bool foundPhoneNumber(String input) {
    for (int i = 0; i < getClientAccountsLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        currentAccount = i;
        return false;
      }
    }
    return true;
  }

  static bool validPhoneNumber(String input) {
    RegExp regPhoneNumber = new RegExp(r'^09[0|1|2|3][0-9]{8}$',
        caseSensitive: false, multiLine: false);
    if (input.length != 11 || !regPhoneNumber.hasMatch(input)) {
      return true;
    }
    return false;
  }

  static bool alreadyPhoneNumber(String input) {
    for (int i = 0; i < getClientAccountsLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        return true;
      }
    }
    return false;
  }

  static bool editAlreadyPhoneNumber(String input, String oldPhoneNumber) {
    if (oldPhoneNumber == input) {
      return false;
    }
    for (int i = 0; i < getClientAccountsLength(); i++) {
      if (accounts[i].phoneNumber == input) {
        return true;
      }
    }
    accounts[currentAccount].phoneNumber = input;
    return false;
  }

  static bool foundPassword(String input) {
    if (accounts[currentAccount].password == input) {
      return false;
    }
    currentAccount = null;
    return true;
  }

  static bool validEmail(String input) {
    RegExp regEmail = new RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
        multiLine: false, caseSensitive: false);
    if (!regEmail.hasMatch(input)) {
      return true;
    }
    return false;
  }

  static String digester(String str, int capacity) {
    if (str.length < capacity) {
      return str;
    }
    return str.substring(0, capacity - 3) + '...';
  }

  static bool validPassword(String input, {bool confirmPassword = false}) {
    RegExp regPassword =
        new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$", multiLine: false);
    if (regPassword.hasMatch(input) && confirmPassword) {
      ClientMyTextFormField.password = input;
    }
    return !(regPassword.hasMatch(input));
  }

  static bool oldPassword(String input) {
    return !(accounts[currentAccount].password == input);
  }

  static bool confirmPassword(String input) {
    bool flag = ClientMyTextFormField.password == input;
    if (flag) {
      accounts[currentAccount].password = input;
    }
    return !flag;
  }

  static String commentsIDGenerator(CommentTile commentTile) {
    bool flag;
    String randomID;
    do {
      flag = false;
      bool key = false;
      randomID = '#' +
          String.fromCharCode(commentTile.foodName.codeUnitAt(0)) +
          commentTile.clientPhoneNumber
              .substring(commentTile.clientPhoneNumber.length - 4) +
          '-' +
          (Random().nextInt(899) + 100).toString();
      for (int i = 0; i < getClientAccountsLength(); i++) {
        for (int j = 0; j < accounts[i].clientComments.length; j++) {
          if (accounts[i].clientComments[j].id == randomID) {
            flag = true;
            key = true;
            break;
          }
          if (key) {
            break;
          }
        }
      }
    } while (flag);
    return randomID;
  }
}
