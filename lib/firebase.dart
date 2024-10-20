import 'package:birthday/color.dart';
import 'package:birthday/homeScreen.dart';
import 'package:birthday/otpScreen.dart';
import 'package:birthday/phoneAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool loading = false;


signUpp(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Account Sucessfully Created',
            style: TextStyle(color: bg),
          ),
          backgroundColor: black,
        ),
      );
    }

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Password is weak',
              style: TextStyle(color: bg),
            ),
            backgroundColor: black,
          ));

    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Account already exist',
              style: TextStyle(color: bg),
            ),
            backgroundColor: black,
          ));
    }
  } catch (e) {
    print(e);
  }
}

signIn(

    String emailAddress, String password, BuildContext context) async {

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );



  } on FirebaseAuthException catch (e) {

  //  setState(() {
   //   loading= false;
   // });
    showDialog(
        context: context, builder: (context) {
      return AlertDialog(
        content: Text(e.message.toString()),
      );
      
    }
    );

  }
}

//void setState(Null Function() param0) {
//}

  forgotPassword( String emailAddress ,BuildContext context) async {
    try {
      final passward = await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailAddress);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text('Code Successfully sent'),
        );
      });
    }

    on FirebaseAuthException catch (e) {
      print(e);
      // throw Exception(e.message.toString());

      //catch (err) {
      // throw Exception(err.toString());
      showDialog(
          context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      }
      );
    }
  }
  phoneVarification (BuildContext context)async {
    try {
      final otp = await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String varificationid, int? resendtoken) {
            Get.to(otpScreen(varificationid: '',));
          //  Navigator.push(context, MaterialPageRoute(builder: (context ) => otpScreen()));
          },

          codeAutoRetrievalTimeout: (varificationId) {},
          phoneNumber: Phone_Auth.text.toString()); // controller of phoneauth
    }on FirebaseAuthException catch(e) {
      print('e');
    }
  }
  otpVarification (dynamic otpController, dynamic widget)async {
   try {
     PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otpController.text.toString()); //String varible and controller of otp
     FirebaseAuth.instance.signInWithCredential(credential).then ((value) {
Get.to(homeScreen());
     }
     ) ;
   }on FirebaseAuthException catch (e) {

   }
  }