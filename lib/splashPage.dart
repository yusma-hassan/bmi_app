
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
     color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/bmi.jpeg",
              )
              ),
          ),
          Text("Your BMI",style: TextStyle(fontSize: 40,color: Colors.white, ),)
        ],
      ),
      
    ),
  );

  }
}

