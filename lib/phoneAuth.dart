import 'package:birthday/color.dart';
import 'package:birthday/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class honeAuth extends StatefulWidget {
  const honeAuth({super.key});

  @override
  State<honeAuth> createState() => _honeAuthState();
}
TextEditingController Phone_Auth= TextEditingController();
class _honeAuthState extends State<honeAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: bg,),
      backgroundColor: bg,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(alignment:Alignment.topLeft,child: Text('OTP screen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
            suffixIcon: Icon(Icons.phone),
                hintText:  'Input number',
                labelText: 'Enter number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))
              ),
              controller: Phone_Auth,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 50,width: 280,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg),
                onPressed: () {
                  phoneVarification(context);
                }, child: Text('Varify Phone Number')),
          )
        ],
      ),
    );
  }
}
