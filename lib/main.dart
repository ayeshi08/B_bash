 import 'package:birthday/dropdown.dart';
import 'package:birthday/homeScreen.dart';
import 'package:birthday/phoneAuth.dart';
import 'package:birthday/splash.dart';
import 'package:birthday/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';

import 'otpScreen.dart';


void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDBwnz9XghNMJgF-n2OLwdNJ4c6KmLnlOY",
      appId: "1:497897414827:android:4f7e800b983736475cd7ee",
      messagingSenderId: "497897414827",
      projectId: "fir-16718",
    ),
  )
  :await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
home: Splash( ),
     );
   }
 }
