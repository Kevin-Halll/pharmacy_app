import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/home/homePage.dart';
import 'package:pharmacy_app/main.dart';
import 'package:pharmacy_app/services/auth_service.dart';
import '../../custom_widgets/buttons.dart';
import '../../custom_widgets/colors.dart';
import '../../custom_widgets/inputField.dart';
import '../../custom_widgets/text.dart';
import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
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
                        const SizedBox(
                          height: 20,
                        ),
                        XLText(
                          text: 'Sign In',
                          color: AppColor.secondBlue,
                        ),
                        SmallText(
                          text: 'Welcome Back!',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          InputField(
                            hint: "Email",
                            InputIcon: Icons.email_outlined,
                            controllerName: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PasswordField(
                            hint: "Password",
                            InputIcon: Icons.lock_outlined,
                            controllerName: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "You must enter a password";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColor.thirdBlue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MainButtons(
                              textValue: "SIGN IN",
                              onclickFunction: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  String? loginErrorMessage =
                                      await _authService.login(
                                    User(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );

                                  bool loginFailed =
                                      loginErrorMessage != null ? true : false;

                                  // User sign in failed
                                  if (loginFailed) {
                                    // Checks if context is mounted before routing with build context
                                    if (!mounted) return;

                                    ScaffoldMessenger.of(context)
                                        .showMaterialBanner(
                                      MaterialBanner(
                                        backgroundColor: AppColor.secondBlue,
                                        content: Text(
                                          loginErrorMessage.capitalize(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Builder(builder: (context) {
                                            Timer(const Duration(seconds: 5),
                                                () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentMaterialBanner();
                                            });

                                            return Container();
                                          }),
                                        ],
                                      ),
                                    );
                                  }

                                  if (loginFailed == false) {
                                    // Checks if context is mounted before routing with build context
                                    if (!mounted) return;

                                    ScaffoldMessenger.of(context)
                                        .showMaterialBanner(
                                      MaterialBanner(
                                        backgroundColor:
                                            CupertinoColors.activeGreen,
                                        content: const Text(
                                          "Successfully Signed In",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Builder(builder: (_context) {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner();
                                            Timer(
                                                const Duration(
                                                  milliseconds: 1300,
                                                ), () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                                  return const HomePage();
                                                }),
                                              );
                                            });

                                            return Container();
                                          }),
                                        ],
                                      ),
                                    );
                                  }
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MediumText(text: "Don't have an account?"),
                        const SizedBox(
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
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(
                            endIndent: 10,
                            thickness: 1,
                          ),
                        ),
                        MediumText(
                          text: "OR",
                          color: AppColor.mainGrey,
                        ),
                        const Expanded(
                          child: Divider(
                            indent: 10,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(color: AppColor.mainGrey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                        const SizedBox(
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
