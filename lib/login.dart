import 'dart:math';

import 'package:birthday/color.dart';
import 'package:birthday/firebase.dart';
import 'package:birthday/forgotpassword.dart';
import 'package:birthday/loading.dart';
import 'package:birthday/phoneAuth.dart';
import 'package:birthday/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
bool passToggle =true;
bool loading = false;

  @override
  Widget build(BuildContext context) {
    return
     loading ? Loading() :
      Scaffold(backgroundColor: bg,
      appBar: AppBar(backgroundColor: bg,),
      body: Form(
        key: _formfield,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 100,height: 100,
                    child: Image(image: AssetImage('assets/images.png') ,fit: BoxFit.cover, )),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0,left: 8,right: 8),
                  child: TextFormField(controller: email,decoration: InputDecoration(
                    label: Text("Email"),
                      hintText: 'Enter Email ',
                    border: OutlineInputBorder(),
            
                    prefixIcon: Icon(Icons.email),
                ),
                    validator:(value){
            
                if (!(value.toString().contains('@'))) {
                return "Invalid Email";
                } else {
                return null;
                }
            
                      },
            
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0,left: 8,right: 8),
                  child: TextFormField(keyboardType: TextInputType.emailAddress,
                  controller: password,
                    key: ValueKey('password'),
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        label: Text("Password"),
                      hintText: 'Enter Password ',
                      border: OutlineInputBorder(),
                     prefixIcon: Icon(Icons.lock),
            
                     suffixIcon:InkWell(
                       onTap: () {
                         setState(() {
                           passToggle =!passToggle;
                         });
                       },
                     child:   Icon(passToggle? Icons.visibility:Icons.visibility_off), ) ,
            
                 ),
                    validator:(value){
            
                      if (value.toString().length<6 ) {
                        setState(() {
                          loading=false;
                        });
                        return 'Please enter valid Password';
                      }else {
                        return null;
                      }
                    } ,
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8),
                  child: SizedBox(width:245,height:50,child:
                  ElevatedButton( style:  ElevatedButton.styleFrom(backgroundColor: black,
                    foregroundColor: bg),
                    child:
            
                    Text('Sign in'),
                      onPressed: ( ) async{
            
            
                    if (_formfield.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });

                      String credential = await signIn(email.text,password.text, context);



            
                      if (credential == FirebaseAuthException) {
            
                        setState(() {
                           loading= false;
                        });
                      }
            
                 }

                    },
            
                )
                         ),
                ),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                  Get.to(forgotPass());
                },
            
                    child: Align(alignment:Alignment.bottomRight,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Forgot Passowrd',style: TextStyle(fontSize: 14,color: Colors.blue),),
                    ))),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or create new Account?',style: TextStyle(fontSize: 17),),
                      TextButton(onPressed: () {
                        Get.to(signUp());
                      },
                          child:Text('Register',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
            
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12,),
                SizedBox(height: 50,width: 250,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg,),
                    onPressed: () {
                    Get.to(honeAuth());
                    }, child: Text("Vaify Phone Number",),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
