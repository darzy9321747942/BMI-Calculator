// import 'dart:ui';
// import 'dart:html';
import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  var wgController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 212, 216),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: wgController,
                decoration: InputDecoration(
                  label: Text("Enter your weight(in kgs)"),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter your height(in feet)"),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                  label: Text("Enter your height (in inch)"),
                  prefixIcon: Icon(Icons.insert_chart),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  var wg = wgController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = wgController.text.toString();

                  if (wg != "" && ft != "" && inch != "") {
                    //bmi calclation
                    var iwg =int.parse(wg);    //to convert string values intoo integers 
                    var ift =int.parse(ft);
                    var iinch =int.parse(inch);
                      
                    var tinch=(ift*12)+iinch; //inch formula => returns inch now calculate cm
                    var tcm=tinch*2.54;    //formula for cm 
                    var tm=tcm/100;         //formula for meter
                    var bmi=iwg/(tm*tm);    //formula for bmi
                    setState(() {
                      result="Your BMI is ${bmi.toStringAsFixed(2)} ";
                    });

                  } else {
                    setState(() {
                      result = "please fill the required blanks";
                    });
                  }
                },
                child: Text("Calculate"),
              ),
              SizedBox(height: 10,),
              Text(
                result,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
