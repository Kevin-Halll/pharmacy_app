import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/add_new_card/add_new_card.dart';
import 'package:pharmacy_app/components/allCategories/allCategories.dart';
import 'package:pharmacy_app/components/cart/cart.dart';
import 'package:pharmacy_app/components/checkout/checkout.dart';
import 'package:pharmacy_app/components/home/homePage.dart';
import 'package:pharmacy_app/components/login/login.dart';
import 'package:pharmacy_app/components/product_details/productDetails.dart';
import 'package:pharmacy_app/components/productsPage/productsPage.dart';
import 'package:pharmacy_app/components/register/register.dart';
import 'package:pharmacy_app/models/user.dart';
import 'package:pharmacy_app/services/auth_service.dart';

import 'components/profile_edit/components_edit_profile/edit_profile_items.dart';

void main() {
  runApp(const MyApp());
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<String?>(
        future: AuthService().getLocalUser("user"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const LoginPage();
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data != "") {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
      routes: {
        '/all-categories': (context) => allCategories(),
        '/products': (context) => ProductsPage(),
        '/details': (context) => ProductDetails(),
        '/cart': (context) => Cart(),
        '/login': (context) => LoginPage(),
        '/profile-edit': (context) => EditProfileItems(),
        '/add-new-card': (context) => Add_New_Card(),
        // '/categories': (context) => Category(),
        '/register': (context) => RegisterPage(),
        '/checkout': (context) => CheckoutPage(),
        // '/user': (context) => UserProfile(),
        // 'products': (context) => Products(),
      },
    );
  }
}
