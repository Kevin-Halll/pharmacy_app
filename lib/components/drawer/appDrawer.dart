import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/custom_widgets/colors.dart';
import 'package:pharmacy_app/services/auth_service.dart';

class HamburgerMenu extends StatefulWidget {
  HamburgerMenu({
    super.key,
    required this.fullName,
    required this.email,
  });

  String fullName;
  String email;

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //<------------ menu information section ------------>
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColor.secondBlue),
            accountName: Text(widget.fullName),
            accountEmail: Text(widget.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                widget.fullName.split((" "))[0],
                style: const TextStyle(fontSize: 40.0),
              ),
            ),
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.medication,
            ),
            title: const Text('Medication Tracker'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          //<------------  list tile has each section ------------>
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.power_settings_new,
            ),
            title: const Text('Logout'),
            onTap: () async {
              await AuthService().logout();

              // Checks if widget context is mounted
              if (!mounted) return;

              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
