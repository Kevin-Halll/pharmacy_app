import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 40,),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/LOGO.png'),
                  Text('Amber Care Pharmaceuticals', style: TextStyle(color: AppColor.secondBlue),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
