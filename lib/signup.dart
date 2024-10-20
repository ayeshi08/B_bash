import 'package:birthday/color.dart';
import 'package:birthday/firebase.dart';
import 'package:flutter/material.dart';

class signUp extends StatelessWidget {
    signUp({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bg,
    body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(width: 100,height: 100,
    child: Image(image: AssetImage('assets/images.png') ,fit: BoxFit.cover, )),
    Padding(
    padding: const EdgeInsets.only(top: 28.0,left: 8,right: 8),
    child: TextFormField(
      key: ValueKey('email'),
      controller: email,
      decoration: InputDecoration(hintText: 'Enter Email ',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: under)),focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: black),)
    ),
      validator:(value){

        if(!(value.toString().contains('@')) ) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Incorrect Email',
                  style: TextStyle(color: bg),
                ),
                backgroundColor: black,
              ));
        }else {
          return null;
        }
      } ,
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 28.0,left: 8,right: 8),
    child: TextFormField(controller: password,decoration: InputDecoration(hintText: 'Enter Password ',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: under)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: black), )
    ),
      validator:(value){

        if (value.toString().length<6) {
          return 'Please enter valid Password';
        }else {
          return null;
        }
      } ,
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8),
    child: SizedBox(width:245,height:50,child: ElevatedButton( style:  ElevatedButton.styleFrom(backgroundColor: black,
    foregroundColor: bg),
    onPressed: ( ) {signUpp(email.text,password.text,  context);}, child: Text('Sign Up'),

    // () =>signIn())  , child: Text('Login'))
    )
    ),),
      Padding(
        padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8),
        child: SizedBox(height: 50, width: 245,
          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg),
              onPressed: () {Navigator.pop(context);}, child: Text('Back to Login')),
        ),
      ),
    ],
    ),
    ),
    );
    }
}
