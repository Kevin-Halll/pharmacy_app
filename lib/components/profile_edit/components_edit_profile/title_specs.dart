import 'package:flutter/material.dart';

import '../constants_edit_profile/constants.dart';

class title_specs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: Text(
        'Edit Profile',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
      ),
    );
  }
}

class text_title extends StatelessWidget {
  text_title({@required this.textbox_title});
  final String? textbox_title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.bottomLeft,
      child: Text(
        textbox_title.toString(),
        style: kTextStyle,
      ),
    );
  }
}
