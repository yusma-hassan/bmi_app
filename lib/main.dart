import 'dart:ffi';

import 'package:bmi_app/splashPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Splashpage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchesController = TextEditingController();

  double BMI = 0.0;
  var category = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
            child: Text(
          "Your BMI",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  "Weight:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                    hintText: "Enter weight in kg...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade800, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  "Height:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: feetController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                    hintText: "Enter height in feet...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade800, width: 2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inchesController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                    hintText: "Enter height in inches...",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade800, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade100,
              elevation: 5,
            ),
            onPressed: () {
              var feet = int.parse(feetController.text);
              var inches = int.parse(inchesController.text);
              double weight = double.parse(weightController.text);
              var heightInMeters = (feet * 0.3048) + (inches * 0.0254);

              if (heightInMeters == 0 || weight == 0) {
                BMI = 0;
              } else {
                BMI = weight / (heightInMeters * heightInMeters);
              }
              if(BMI  < 18.5){
                  category = "Underweight";
              }
              else if(BMI>= 18.5 && BMI <= 24.9){
                category = "Normal";
              }
              else if(BMI >= 25 && BMI <=29.9){
                category = "Overweight";
              }
              else{
                category = "Obesity";
              }

              print(weightController.text);
              print(feetController.text);
              print(inchesController.text);
              print(BMI);

              setState(() {});
            },
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: 25, color: Colors.indigo),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Your BMI is:",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "${BMI}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10,),
          Text(
            "Category: ${category}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
