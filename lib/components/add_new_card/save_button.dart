import 'package:flutter/material.dart';


class SaveButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF1B75BC),
        ),
        height: 50.0,
        child: Center(
          child: Text(
           'Add Card',
          style: TextStyle(
            fontSize:20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
        ),
        margin: EdgeInsets.only(top: 70.0),
      ),
    );
  }
}
