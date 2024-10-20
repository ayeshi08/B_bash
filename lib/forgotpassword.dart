import 'package:birthday/login.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'firebase.dart';

class forgotPass extends StatefulWidget {
  forgotPass({super.key});

  @override
  State<forgotPass> createState() => _forgotPassState();
}

final email = TextEditingController();

class _forgotPassState extends State<forgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bg,
      appBar: AppBar(backgroundColor: bg,),
      body:
      Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Text('Forgot Password',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)),
          SizedBox(height: 80,),
          Text('Enter Email for Password Reset Code'),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(controller: email,
            decoration: InputDecoration(
              label: Text("Enter email"),
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),),
          ),
          SizedBox(height: 12,),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg),
              onPressed: () async
              {
                String passward = forgotPassword (email.text  , context);
              },
              child: SizedBox(width:200,height:50,child: Center(child: Text('Submit')))),
          Padding(
            padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8),
            child: SizedBox(height: 50, width: 245,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg),
                  onPressed: () {Navigator.pop(Login() as BuildContext);}, child: Text('Back to Login')),
            ),
          ),
        ],
      ),
    );
  }
}


