import 'package:flutter/material.dart';

class MainButtons extends StatefulWidget {
  final onclickFunction;
  final String textValue;
  const MainButtons({super.key, this.onclickFunction, required this.textValue});

  @override
  State<MainButtons> createState() => _MainButtonsState(); 
}

class _MainButtonsState extends State<MainButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onclickFunction,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(27, 117, 188, 10),
            borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(widget.textValue,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
