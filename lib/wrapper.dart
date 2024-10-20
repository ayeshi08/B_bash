import 'package:birthday/homeScreen.dart';
import 'package:birthday/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _rapperState();
}

class _rapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
    if (snapshot.hasData){
    return homeScreen();
    }
                  else {
      return Login();
    }
        }
      ),
    );
  }
}
