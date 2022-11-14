import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/allCategories/allCategories.dart';
import 'package:pharmacy_app/components/cart/cart.dart';
import 'package:pharmacy_app/components/checkout/checkout.dart';
import 'package:pharmacy_app/components/home/homePage.dart';
import 'package:pharmacy_app/components/login/login.dart';
import 'package:pharmacy_app/components/product_details/productDetails.dart';
import 'package:pharmacy_app/components/productsPage/productsPage.dart';
import 'package:pharmacy_app/components/register/register.dart';
import 'package:pharmacy_app/services/auth_service.dart';

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
      home: FutureBuilder<String>(
        future: AuthService().getLocalUser("user"),
        builder: (context, snapshot) {
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
        '/register': (context) => RegisterPage(),
        '/checkout': (context) => CheckoutPage(),
        // '/user': (context) => UserProfile(),
        // 'products': (context) => Products(),
      },
    );
  }
}
