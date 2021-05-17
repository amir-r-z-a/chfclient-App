import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Common/Text/MyTextFormField.dart';

class Accounts {
  static List<Client> _accounts = List.empty(growable: true);
  static int _currentAccount = 0;

//edit

  static List<Client> get accounts => _accounts;

  static set accounts(List<Client> value) {
    _accounts = value;
  }

  static int get currentAccount => _currentAccount;

  static set currentAccount(int value) {
    _currentAccount = value;
  }

  static void addAccount(Client client) {
    accounts.add(client);
  }

  static int getLength() {
    return _accounts.length;
  }

  static bool foundPhoneNumber(String input) {
    for (int i = 0; i < getLength(); i++) {
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
    for (int i = 0; i < getLength(); i++) {
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
    for (int i = 0; i < getLength(); i++) {
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
      MyTextFormField.password = input;
    }
    return !(regPassword.hasMatch(input));
  }

  static bool oldPassword(String input) {
    return !(accounts[currentAccount].password == input);
  }

  static bool confirmPassword(String input) {
    bool flag = MyTextFormField.password == input;
    if (flag) {
      accounts[currentAccount].password = input;
    }
    return !flag;
  }
}
