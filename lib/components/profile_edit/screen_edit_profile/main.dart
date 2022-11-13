import 'package:flutter/material.dart';
import 'package:profile_edit_mock/components_edit_profile/edit_profile_items.dart';

void main() {
  runApp(EditProfile());
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileItems(),
    );
  }
}
