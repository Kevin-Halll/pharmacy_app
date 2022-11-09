import 'package:flutter/material.dart';

import '../../utils/buttons.dart';
import '../../utils/colors.dart';
import '../../utils/inputField.dart';
import '../../utils/text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/LOGO.png'),
                        Text(
                          'Amber Care Pharmaceuticals',
                          style: TextStyle(color: AppColor.secondBlue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        XLText(
                          text: 'Register',
                          color: AppColor.secondBlue,
                        ),
                        SmallText(
                          text: 'Create your account',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Form(
                        child: Column(
                          children: [
                            InputField(hint: "Full Name", InputIcon: Icons.person),
                            SizedBox(
                              height: 15,
                            ),
                            InputField(hint: "Email", InputIcon: Icons.email_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            InputField(hint: "Mobile Number", InputIcon: Icons.phone_android_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            PasswordField(hint: "Password", InputIcon: Icons.lock_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MainButtons(
                              textValue: "SIGN UP",
                              onclickFunction: () {
                                Navigator.pushNamed(context, "/");
                              },
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediumText(text: "Already have an account?"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: MediumText(
                            text: "Sign in",
                            color: AppColor.secondBlue,
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ],
          )
      ),
    );
  }
}