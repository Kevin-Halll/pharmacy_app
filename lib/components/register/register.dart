import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/main.dart';
import 'package:pharmacy_app/models/user.dart';
import 'package:pharmacy_app/services/auth_service.dart';

import '../../custom_widgets/buttons.dart';
import '../../custom_widgets/colors.dart';
import '../../custom_widgets/inputField.dart';
import '../../custom_widgets/text.dart';
import '../home/homePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final _authService = AuthService();

  String? requiredValidator(String? value, String? errorMessage) {
    String requiredField = "This is a required field";

    if (value == null || value.isEmpty) {
      return errorMessage ?? requiredField;
    }

    return null;
  }

  String formatPhoneNumber(String text) {
    RegExp phoneNumber = RegExp(r'(\d+)');

    if (phoneNumber.hasMatch(text) &&
        phoneNumber.allMatches(text).length > 11) {
      return "invalid phone number";
    }

    String formattedNumber =
        "${text.substring(0, 3)}-${text.substring(3, 6)}-${text.substring(6, 10)}";

    return formattedNumber;
  }

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

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
                        text: 'Register',
                        color: AppColor.secondBlue,
                      ),
                      SmallText(
                        text: 'Create your account',
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
                      children: [
                        InputField(
                          controllerName: _fullNameController,
                          validator: (value) {
                            return requiredValidator(
                              value,
                              "Full Name is a required field!",
                            );
                          },
                          hint: "Full Name",
                          InputIcon: Icons.person,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          controllerName: _emailController,
                          validator: (value) {
                            return requiredValidator(
                              value,
                              "Email is a required field!",
                            );
                          },
                          hint: "Email",
                          InputIcon: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          controllerName: _phoneNumberController,
                          maxLength: 10,
                          validator: (value) {
                            return requiredValidator(
                              value,
                              "Mobile Number is a required field!",
                            );
                          },
                          hint: "Mobile Number",
                          InputIcon: Icons.phone_android_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PasswordField(
                          controllerName: _passwordController,
                          hint: "Password",
                          InputIcon: Icons.lock_outlined,
                          validator: (value) {
                            return requiredValidator(
                              value,
                              "Password is a required field!",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MainButtons(
                          textValue: "SIGN UP",
                          onclickFunction: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              Map<String, dynamic> registerResponse =
                                  await _authService.register(
                                User(
                                  fullName: _fullNameController.text,
                                  email: _emailController.text,
                                  phoneNumber: formatPhoneNumber(
                                    _phoneNumberController.text,
                                  ),
                                  password: _passwordController.text,
                                ),
                              );

                              bool accountCreated = registerResponse['success'];

                              if (accountCreated) {
                                /* Successful Registration */

                                // Checks if context is mounted before routing with build context
                                if (!mounted) return;

                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(
                                  MaterialBanner(
                                    backgroundColor:
                                        CupertinoColors.activeGreen,
                                    content: const Text(
                                      "Successfully Registered",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Builder(
                                        builder: (context) {
                                          Timer(
                                            const Duration(
                                              milliseconds: 1300,
                                            ),
                                            () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentMaterialBanner();

                                              if (!mounted) return;

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const HomePage();
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                          return Container();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                /* Failed Registration */

                                // Checks if context is mounted before routing with build context
                                if (!mounted) return;

                                // TODO Fix ScaffoldMessenger closure error
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(
                                  MaterialBanner(
                                    backgroundColor: AppColor.secondBlue,
                                    content: Text(
                                      (registerResponse['message'] as String)
                                          .capitalize(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Builder(builder: (context) {
                                        Timer(const Duration(seconds: 5), () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentMaterialBanner();
                                        });

                                        return Container();
                                      }),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumText(text: "Already have an account?"),
                      const SizedBox(
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
        ),
      ),
    );
  }
}
