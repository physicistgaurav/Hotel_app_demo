// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userauthfull/drawer.dart';
import 'package:flutter_userauthfull/homepage.dart';
import 'package:flutter_userauthfull/loginform.dart';
import 'package:flutter_userauthfull/main.dart';
import 'package:flutter_userauthfull/pages/homebottom.dart';
import 'package:flutter_userauthfull/pages/inboxb.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class ProfilBottom extends StatefulWidget {
  const ProfilBottom({Key? key}) : super(key: key);

  @override
  State<ProfilBottom> createState() => _ProfilBottomState();
}

class _ProfilBottomState extends State<ProfilBottom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          drawer: NavDrawer(),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 330,
                      color: Color.fromARGB(247, 131, 131, 125),
                    ),
                    // Positioned(
                    //   top: 20,
                    //   left: 15,
                    //   child: GestureDetector(
                    //     onTap: (() {}),
                    //     child: Icon(
                    //       Icons.settings,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
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
                          Container(
                            margin: EdgeInsets.only(top: 18),
                            padding: EdgeInsets.all(10),
                            child: Card(
                              color: Color.fromARGB(255, 207, 193, 188),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          "Photos",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "45",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          "Followers",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "328",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 15, bottom: 5),
                                        child: Text(
                                          "Following",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "179",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          UserInfo()
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            elevation: 20,
            color: Color.fromARGB(255, 224, 214, 210),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.black87),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.my_location),
                          title: Text("Location"),
                          subtitle: Text("Kathmandu"),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text("gauravrijal03@gmail.com"),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.phone),
                          title: Text("Phone"),
                          subtitle: Text("9825339449"),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.person),
                          title: Text("Bio"),
                          subtitle: Text(
                              "Always code as if the person who ends up maintaining your code will be a violent psychopath who knows where you live"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class MyDrawer extends StatefulWidget {
//   const MyDrawer({Key? key}) : super(key: key);

//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 10),
//           height: 100,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: AssetImage('assets/cv.png'),
//             ),
//           ),
//         ),
//         Text(
//           "Gaurav Rizal",
//           style: TextStyle(color: Colors.white, fontSize: 14),
//         ),
//         Text(
//           "gauravrijal03@gmail.com",
//           style: TextStyle(color: Colors.grey[200], fontSize: 12),
//         ),
//         Container(
//           color: Colors.amber,
//         )
//       ],
//     );
//   }
// }

// class DrawerList extends StatefulWidget {
//   const DrawerList({Key? key}) : super(key: key);

//   @override
//   State<DrawerList> createState() => _DrawerListState();
// }

// class _DrawerListState extends State<DrawerList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 15),
//       child: Column(
//         children: [
//           GestureDetector(
//             child: ListTile(
//                 title: Text("Homey"),
//                 leading: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginForm()));
//                       });
//                     },
//                     icon: Icon(Icons.home))),
//           ),
//           Divider(
//             color: Colors.black12,
//           ),
//           ListTile(
//             title: Text("My Profile"),
//             leading: Icon(Icons.person),
//           ),
//           Divider(),
//           ListTile(
//             title: Text("Notifications"),
//             leading: Icon(Icons.notifications),
//           ),
//           Divider(),
//           ListTile(
//             title: Text("Settings"),
//             leading: Icon(Icons.settings),
//           ),
//           Divider(),
//           ListTile(
//             title: Text("Contact us"),
//             leading: Icon(Icons.contact_mail),
//           ),
//           Divider(),
//           GestureDetector(
//             child: ListTile(
//               title: Text("Logout"),
//               leading: Icon(Icons.logout),
//               onTap: () {
//                 FirebaseAuth.instance.signOut();
//               },
//             ),
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }




// ElevatedButton(
//           onPressed: () {
//             
//           },
//           child: Text("Logout"),
//         ),


// Positioned(
//               top: 36,
//               right: 16,
//               child: FloatingActionButton(
//                 backgroundColor: Colors.transparent,
//                 child: Icon(
//                   Icons.logout,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                 },
//               ),
//             ),


