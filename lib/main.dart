import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/add_new_card/add_new_card.dart';
import 'package:pharmacy_app/components/allCategories/allCategories.dart';
import 'package:pharmacy_app/components/cart/cart.dart';
import 'package:pharmacy_app/components/home/homePage.dart';
import 'package:pharmacy_app/components/login/login.dart';
import 'package:pharmacy_app/components/product_details/productDetails.dart';
import 'package:pharmacy_app/components/productsPage/productsPage.dart';

import 'components/profile_edit/components_edit_profile/edit_profile_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/all-categories': (context) => allCategories(),
        '/products': (context) => ProductsPage(),
        '/details': (context) => ProductDetails(),
        '/cart': (context) => Cart(),
        '/login': (context) => LoginPage(),
        '/profile-edit': (context) => EditProfileItems(),
        '/add-new-card': (context) => Add_New_Card(),
        // '/categories': (context) => Category(),
        // '/user': (context) => UserProfile(),
        // 'products': (context) => Products(),
      },
    );
  }
}
