import 'package:birthday/color.dart';
import 'package:birthday/dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
     homeScreen({super.key});
  final user=FirebaseAuth.instance.currentUser;
signout () async{
  await FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bg,
      appBar: AppBar( backgroundColor:bg,actions: [

    ], ),
      body:  
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children:[
                Padding(
                    padding: const EdgeInsets.only(top: 40.0,left: 8,right: 8),
                    child: Container ( decoration: BoxDecoration(
        
                    ),
                      width:MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
        
                      child: Column(
                      children: [
                        Container(
                      child: Align(alignment:Alignment.topLeft,child: Text('Add Birthdate',style: TextStyle(color: outline,fontSize: 20 ,fontFamily: 'Roboto',fontWeight: FontWeight.w800),)),),
                        Dropdown(),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Container(
        
                             // width: 270,height: 50,
                              child: Align(alignment:Alignment.topLeft,child:  Text('View List',style: TextStyle(color: outline,fontSize: 20 ,fontFamily: 'Roboto',fontWeight: FontWeight.w800),))),
        
                        ),
                        Dropdown(),
                        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: black,foregroundColor: bg),
                            onPressed: (() => signout()),
                            child: Text('Sign out'))
                      ],
                    ),
        
        
                    //  child: Align(alignment:Alignment.topLeft,child:  Text('Add Birthdate',style: TextStyle(color: outline,fontSize: 20 ,fontFamily: 'Roboto'),))),
                                ),
                  ),
          
          
        
              ]
          
            ),
        ),
      ),

    );
  }
}
