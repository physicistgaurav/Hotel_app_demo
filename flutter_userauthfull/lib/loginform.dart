// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String tempError = "";

  Future submit() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => print(value.user?.uid))
        .onError((error, stackTrace) {
      print(error.toString());
      setState(() {
        tempError = error.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: "Enter Email", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "Enter Password", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              submit();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text("Login"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(tempError)
        ],
      ),
    );
  }
}
