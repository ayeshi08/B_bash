import 'package:birthday/firebase.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class otpScreen extends StatefulWidget {
  String varificationid;
    otpScreen({super.key,required this.varificationid});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bg,
      appBar: AppBar(title: Text('OTP Submission',),
        centerTitle: true, backgroundColor: bg,),
      body:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align( alignment:Alignment.topLeft,child: Text('Enter your OTP',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500) )),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextFormField(keyboardType: TextInputType.number,
              controller: otpController,
              decoration: InputDecoration
                (border:OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                hintText: 'Enter the Otp',
                suffixIcon: Icon(Icons.phone),

              ),
            ),
          ),
          SizedBox(height: 12,),
      SizedBox(height: 50,width: 280,
        child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black),
            onPressed: () {
          otpVarification (otpController, widget);
            }, child: Text("Submit OTP",style: TextStyle(color: bg),),),),
        ],
      ) ,
    );
  }
}
