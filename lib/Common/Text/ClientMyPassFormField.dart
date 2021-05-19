import 'package:chfclient/Classes/ClientAccounts.dart';
import 'package:chfclient/Common/Text/ClientMyTextFormField.dart';
import 'package:flutter/material.dart';

class ClientMyPassFormField extends StatefulWidget {
  String label;
  String regex;
  String hint;
  int index;

  ClientMyPassFormField(
    this.label, {
    this.index,
    this.regex,
    this.hint,
  });

  @override
  _ClientMyPassFormFieldState createState() => _ClientMyPassFormFieldState();
}

class _ClientMyPassFormFieldState extends State<ClientMyPassFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String value) {
        ClientMyTextFormField.password = value;
      },
      validator: (String value) {
        if (value.isEmpty || value == null) {
          return "You must fill this box";
        } else if (widget.regex == 'PassSignUp' &&
            ClientAccounts.validPassword(value)) {
          return 'Your password should contain at least one number and one letter';
        } else if (widget.regex == 'PassSignIn' &&
            ClientAccounts.foundPassword(value)) {
          return "Your password is not correct";
        } else if (widget.regex == 'PassEdit1' && ClientAccounts.oldPassword(value)) {
          return 'Your input does not match your old password';
        } else if (widget.regex == 'PassEdit2' &&
            ClientAccounts.validPassword(value, confirmPassword: true)) {
          return 'Your password should contain at least one number and one letter';
        } else if (widget.regex == 'PassEdit3' &&
            ClientAccounts.confirmPassword(value)) {
          return 'Your input does not match your new password';
        }
        return null;
      },
      obscureText: _isObscure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(248, 95, 106, 1), width: 2.0)),
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 95, 106, 1),
        ),
        suffixIcon: IconButton(
          color: Color.fromRGBO(248, 95, 106, 1),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(248, 95, 106, 1)),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color.fromRGBO(209, 214, 219, 1),
        ),
      ),
    );
  }
}

//    return TextFormField(
//       validator: (String value) {
//         if (value.isEmpty || value == null) {
//           return "Please enter something";
//         } else if (Accounts.foundPassword(value)) {
//           return "Your password is not correct";
//         }
//         return null;
//       },
//       obscureText: _isObscure,
//       decoration: InputDecoration(
//         suffixIcon: IconButton(
//           color: Color.fromRGBO(248, 95, 106, 1),
//           onPressed: () {
//             setState(() {
//               _isObscure = !_isObscure;
//             });
//           },
//           icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
//         ),
//         labelText: "Password",
//         labelStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: Color.fromRGBO(248, 95, 106, 1),
//         ),
//         hintText: "Your password ",
//         hintStyle: TextStyle(
//           fontSize: 16,
//           color: Color.fromRGBO(209, 214, 219, 1),
//         ),
//         errorStyle: TextStyle(
//           color: Color.fromRGBO(248, 95, 106, 1),
//         ),
//       ),
//     );
