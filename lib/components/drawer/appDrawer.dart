import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  //<------------ variables to be substituted with data from database ------------>
  String _firstName = 'Janet';
  String _lastName = 'Williams';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //<------------ menu information section ------------>
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('$_firstName ' '$_lastName'),
            accountEmail: Text("janet977@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "${_firstName[0]}",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: Icon(
              Icons.medication,
            ),
            title: const Text('Medication Tracker'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
              Icons.power_settings_new,
            ),
            title: const Text('Logout'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
