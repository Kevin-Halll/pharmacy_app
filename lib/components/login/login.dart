import 'package:flutter/material.dart';
import '../../custom_widgets/buttons.dart';
import '../../custom_widgets/colors.dart';
import '../../custom_widgets/inputField.dart';
import '../../custom_widgets/text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                          text: 'Sign In',
                          color: AppColor.secondBlue,
                        ),
                        SmallText(
                          text: 'Welcome Back!',
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
                        InputField(
                            hint: "Email", InputIcon: Icons.email_outlined),
                        SizedBox(
                          height: 15,
                        ),
                        PasswordField(
                            hint: "Password", InputIcon: Icons.lock_outlined),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Forgot Password?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: AppColor.thirdBlue,
                                    decoration: TextDecoration.underline))),
                        SizedBox(
                          height: 25,
                        ),
                        MainButtons(
                          textValue: "SIGN IN",
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
                        MediumText(text: "Don't have an account?"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          child: MediumText(
                            text: "Sign up",
                            color: AppColor.secondBlue,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider(
                  //   thickness: 2,
                  // ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          endIndent: 10,
                          thickness: 1,
                        )),
                        MediumText(
                          text: "OR",
                          color: AppColor.mainGrey,
                        ),
                        Expanded(
                            child: Divider(
                          indent: 10,
                          thickness: 1,
                        )),
                      ])),

                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.mainBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Image.asset("assets/images/facebook.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(color: AppColor.mainGrey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.mainBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Image.asset("assets/images/google.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(color: AppColor.mainGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
