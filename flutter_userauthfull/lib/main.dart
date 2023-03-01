// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_import, unnecessary_import

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/homepage.dart';
import 'package:flutter_userauthfull/loggedinPage.dart';

import 'package:flutter_userauthfull/login1/home.dart';
import 'package:flutter_userauthfull/login1/loginpage.dart';
import 'package:flutter_userauthfull/loginform.dart';
import 'package:flutter_userauthfull/signupform.dart';
import 'package:flutter_userauthfull/temp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoggedinPage();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
