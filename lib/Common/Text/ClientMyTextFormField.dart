import 'package:chfclient/Classes/Client.dart';
import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:flutter/material.dart';

class ClientMyTextFormField extends StatelessWidget {
  static String name;
  static String password;
  static String phoneNumber;
  static List address;
  static String email;

  static String question;

  static double /*String*/ wallet = 0;

  String label;
  String hint;
  String regex;
  int index;
  String initial;
  bool addToAccounts;
  EdgeInsetsGeometry contentPadding;
  String suffix;

  ClientMyTextFormField(this.label,
      {this.index,
      this.hint,
      this.regex,
      this.initial,
      this.addToAccounts = false,
      this.contentPadding,
      this.suffix = ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      cursorColor: Color.fromRGBO(248, 95, 106, 1),
      onSaved: (String value) {
        if (index == 1) {
          addToAccounts
              ? ClientAccounts.accounts[ClientAccounts.currentAccount].name =
                  value
              : name = value;
        } else if (index == 2) {
          addToAccounts
              ? ClientAccounts
                  .accounts[ClientAccounts.currentAccount].phoneNumber = value
              : phoneNumber = value;
        } else if (index == 3) {
          addToAccounts
              ? ClientAccounts.accounts[ClientAccounts.currentAccount].address
                  .add(value)
              : address.add(value);
        } else if (index == 4) {
          addToAccounts
              ? ClientAccounts.accounts[ClientAccounts.currentAccount].email =
                  value
              : email = value;
        } else if (index == 5) {
          question = value;
        } else if (index == 6) {
          wallet = /*value*/ double.parse(value);
        }
      },
      validator: (String value) {
        // print(value);
        if ((index != 4) && (value == null || value.isEmpty)) {
          return "Please enter something";
        } else if (regex == 'PNSignIn' &&
            ClientAccounts.foundPhoneNumber(value)) {
          return "Your phone number is not found";
        } else if (regex == 'PNSignUp') {
          if (ClientAccounts.validPhoneNumber(value)) {
            return 'Your phone number is not valid';
          } else if (ClientAccounts.alreadyPhoneNumber(value)) {
            return 'Your phone number is already registered';
          }
        } else if (regex == 'Email' &&
            value != '' &&
            value != null &&
            ClientAccounts.validEmail(value)) {
          return 'Your email is not valid';
        } else if (regex == 'Wallet' && Client.validWallet(value)) {
          return 'Your input is invalid';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixText: suffix,
        contentPadding: contentPadding,
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 95, 106, 1),
        ),
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(248, 95, 106, 1)),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(209, 214, 219, 1),
        ),
      ),
    );
  }
}
