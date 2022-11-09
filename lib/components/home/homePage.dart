import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/categorySlide/categorySlide.dart';
import 'package:pharmacy_app/components/drawer/appDrawer.dart';
import 'package:pharmacy_app/components/searchBar/searchBar.dart';
import 'package:pharmacy_app/components/specialOffers/specialOffers.dart';

import '../../custom_widgets/colors.dart';
import '../banner/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        // drawer: Drawer(),
        drawer: HamburgerMenu(),
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
              child: Icon(Icons.menu),
            ),
          ),
          // const Icon(Icons.menu,)),
          iconTheme: IconThemeData(
            color: AppColor.mainGrey,
          ),
          titleSpacing: 10,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Hello Kevin',
            style: TextStyle(color: Colors.blueGrey, fontSize: 14),
          ),
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SearchBar(),
                SizedBox(height: 180, child: Banner1()),
                CategorySlide(),
                Offers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
