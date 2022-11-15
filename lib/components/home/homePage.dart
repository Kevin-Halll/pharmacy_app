import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/categorySlide/categorySlide.dart';
import 'package:pharmacy_app/components/drawer/appDrawer.dart';
import 'package:pharmacy_app/components/searchBar/searchBar.dart';
import 'package:pharmacy_app/components/specialOffers/specialOffers.dart';
import 'package:pharmacy_app/services/auth_service.dart';

import '../../custom_widgets/colors.dart';
import '../banner/banner.dart';
import '../login/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  bool actionLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const HamburgerMenu(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Ink(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColor.mainBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu),
            ),
          ),
          // const Icon(Icons.menu,)),
          iconTheme: IconThemeData(
            color: AppColor.mainGrey,
          ),
          titleSpacing: 10,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: FutureBuilder<String?>(
              future: AuthService().getLocalUser('user'),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data != "") {
                  final user = jsonDecode(snapshot.data!);

                  return Text(
                    '👋 Hello, ${user['fullName'].split(" ")[0].trim()}',
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 14),
                  );
                } else {
                  return const Text(
                    '🎊 Welcome Back!',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                  );
                }
              }),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Center(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColor.mainBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.person,
                    color: AppColor.mainGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SearchBar(),
                const SizedBox(height: 180, child: Banner1()),
                const CategorySlide(),
                Offers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
