// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/drawerhead.dart';
import 'package:flutter_userauthfull/loggedinPage.dart';
import 'package:flutter_userauthfull/pages/homebottom.dart';
import 'package:flutter_userauthfull/pages/inboxb.dart';
import 'package:flutter_userauthfull/pages/settings.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(context),
          ],
        ),
      ),
    ));
  }
}

Widget MyDrawerList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        menuItem(context, 1, "Home", Icons.home),
        Divider(),
        menuItem(context, 2, "Profile", Icons.person),
        Divider(),
        menuItem(context, 3, "Notification", Icons.notifications),
        Divider(),
        menuItem(context, 4, "Settings", Icons.settings),
        Divider(),
        menuItem(context, 5, "Contact Us", Icons.contact_mail),
        Divider(),
        menuItem(context, 6, "Logout", Icons.logout),
      ],
    ),
  );
}

Widget menuItem(BuildContext context, int id, String title, IconData icon) {
  return InkWell(
    onTap: () {
      switch (id) {
        case 1:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: HomeBottom())));
          break;
        case 2:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: HomeBottom())));
          break;
        case 3:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: ChatScreen())));
          break;
        case 4:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: ProfileScreen())));
          break;
        case 5:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(body: ChatScreen())));
          break;
        case 6:
          FirebaseAuth.instance.signOut();
          break;
      }
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    },
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              icon,
              size: 20,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
