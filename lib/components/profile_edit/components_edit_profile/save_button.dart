import 'package:flutter/material.dart';
import 'package:profile_edit_mock/constants_edit_profile/constants.dart';

class SaveButton extends StatelessWidget {
  SaveButton(
      {@required this.onTap, @required this.buttonTitle, this.buttonMainColor});

  final VoidCallback? onTap;
  final String? buttonTitle;
  final Color? buttonMainColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: buttonMainColor,
        ),
        height: 50.0,
        child: Center(
          child: Text(
            buttonTitle.toString(),
            style: kButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 70.0),
      ),
    );
  }
}
