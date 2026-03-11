
import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget{
  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  
  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 5), 
    () {
      Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => MyHomePage(),));
    },);
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
     color:Color(0xFF162660),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/Icon.jpeg",
              )
              ),
          ),
          Text("Your BMI",style: TextStyle(fontSize: 40,color: Color(0xFFF1E4D1), ),)
        ],
      ),
      
    ),
  );

  }
}

