import 'package:birthday/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return
      Container(color: bg,
   child:  Center(
        child: SpinKitFadingCircle(
          color: black,
          size: 50.0,

        ),
      ),

    );
  }
}
