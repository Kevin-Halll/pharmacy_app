// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// normal text input field
class InputField extends StatefulWidget {
  final String hint;
  final controllerName;
  final int? maxLength;
  final IconData InputIcon;
  String? Function(String?) validator;

  InputField({
    super.key,
    required this.hint,
    this.controllerName,
    this.maxLength,
    required this.validator,
    required this.InputIcon,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      validator: widget.validator,
      controller: widget.controllerName,
      decoration: InputDecoration(
        prefixIcon:
            Icon(widget.InputIcon, color: Color.fromRGBO(121, 116, 116, 10)),
        hintStyle: TextStyle(color: Color.fromRGBO(121, 116, 116, 10)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Color.fromRGBO(231, 241, 248, 10),
        filled: true,
        hintText: widget.hint,
        isDense: true,
      ),
    );
  }
}

// password field
class PasswordField extends StatefulWidget {
  final String hint;
  final int? maxLength;
  final controllerName;
  final IconData InputIcon;
  String? Function(String?) validator;

  PasswordField({
    super.key,
    this.controllerName,
    this.maxLength,
    required this.hint,
    required this.InputIcon,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  //function that shows and hide password for password fields
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controllerName,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.InputIcon,
          color: Color.fromRGBO(121, 116, 116, 10),
        ),

        // shows or hides password
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ?

                /// Check Show & Hide.
                Icons.visibility
                : Icons.visibility_off,
            color: Color.fromRGBO(121, 116, 116, 10),
          ),
        ),
        hintStyle: TextStyle(
          color: Color.fromRGBO(121, 116, 116, 10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Color.fromRGBO(231, 241, 248, 10),
        filled: true,
        hintText: widget.hint,
        isDense: true,
      ),
    );
  }
}

// class PasswordInput extends InputField {
//   late final String hint;
//   late final controllerName;
//   late final IconData InputIcon;
//   final love;

//   PasswordInput(
//       {required super.hint,
//       required super.InputIcon,
//       super.controllerName,
//       this.love});

//   @override
//   _PasswordInputState createState() => _PasswordInputState();
// }

// class _PasswordInputState extends State<PasswordInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
