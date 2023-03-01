// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/homepage.dart';
import 'package:flutter_userauthfull/loginform.dart';
import 'package:flutter_userauthfull/main.dart';
import 'package:flutter_userauthfull/pages/inboxb.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilBottom extends StatelessWidget {
  const ProfilBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
      backgroundColor: Color.fromRGBO(255, 255, 2555, 9),
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 330,
                color: Colors.deepOrangeAccent,
              ),
              Positioned(
                top: 20,
                left: 15,
                child: GestureDetector(
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 60),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          'assets/cv.png',
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    Text(
                      "Gaurav Rizal",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    Text(
                      "Kathmandu Nepal",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "User information",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}





// ElevatedButton(
//           onPressed: () {
//             
//           },
//           child: Text("Logout"),
//         ),