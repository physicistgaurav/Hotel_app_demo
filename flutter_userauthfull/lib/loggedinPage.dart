// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, file_names, unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/pages/friendsb.dart';
import 'package:flutter_userauthfull/pages/homebottom.dart';
import 'package:flutter_userauthfull/pages/inboxb.dart';
import 'package:flutter_userauthfull/pages/profileb.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoggedinPage extends StatefulWidget {
  const LoggedinPage({Key? key}) : super(key: key);

  @override
  State<LoggedinPage> createState() => _LoggedinPageState();
}

class _LoggedinPageState extends State<LoggedinPage> {
  int index = 1;

  final items = const [
    Icon(Icons.home, size: 22),
    Icon(FontAwesomeIcons.users, size: 22),
    Icon(FontAwesomeIcons.message, size: 22),
    Icon(Icons.person, size: 22),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          index: index,
          color: Colors.blue,
          backgroundColor: Colors.transparent,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
        ),
        body: Container(
          child: getSelectedWidget(index: index),
        ));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget = Container();
    switch (index) {
      case 0:
        widget = const HomeBottom();
        break;
      case 1:
        widget = const FriendsBottom();
        break;
      case 2:
        widget = const Inboxbottom();
        break;
      case 3:
        widget = const ProfilBottom();
        break;
    }
    return widget;
  }
}
