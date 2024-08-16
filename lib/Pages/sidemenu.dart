// ignore_for_file: deprecated_member_use, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatapp/Pages/apppage.dart';
import 'package:chatapp/Pages/settings.dart';
import 'package:chatapp/Services/auth_service.dart';
import 'package:chatapp/Services/login_or_register.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  void logout(BuildContext context) {
    final auth = AuthService();
    auth.signout();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginOrRegister()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
          Expanded(
            child: ListView(
              children: [
                DrawerListTile(
                  title: "Chat",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: "Profile",
                  press: () {},
                ),
                DrawerListTile(
                  title: "Settings",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                DrawerListTile(
                  title: "LogOut",
                  press: () => logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.press, 
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the theme data

    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: TextStyle(
          color: theme.textTheme.bodyMedium?.color, // Use theme color for the text
        ),
      ),
    );
  }
}
