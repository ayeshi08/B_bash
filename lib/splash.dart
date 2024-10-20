import 'dart:async';

import 'package:birthday/homeScreen.dart';
import 'package:birthday/login.dart';
import 'package:birthday/wrapper.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState (){
    super.initState();
    Timer(Duration (seconds: 3),
        ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Wrapper())),
    );


  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color:Colors.indigo,height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:

              Image(image: AssetImage('assets/images.png'),fit: BoxFit.cover,
             ),

          )
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


