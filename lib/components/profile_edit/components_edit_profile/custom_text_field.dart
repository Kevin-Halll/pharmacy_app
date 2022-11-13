import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {@required this.hintText,
      this.inputDecorationForPassword,
      this.password});

  final String? hintText;
  final Widget? inputDecorationForPassword;
  final bool? password;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        // obscureText: password,
        maxLines: 1,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Color(0xFFE7F1F8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          hintText: hintText.toString(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // alignLabelWithHint: false,
          // isDense: true,
        ),
      ),
    );
  }
}
