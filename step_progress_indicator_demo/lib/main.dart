import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Progress Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child:  Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StepProgressIndicator(
            totalSteps: 10,
            currentStep: 8,
            selectedColor: Colors.red,
            unselectedColor: Colors.amber,
            customStep: (index, color) {
              if (index == 0 || index == 3 || index == 9) {
                return Icon(
                  Icons.ac_unit,
                  color: color,
                );
              } else if (index == 1 || index == 6) {
                return Icon(
                  Icons.sentiment_satisfied,
                  color: color,
                );
              } else {
                return Icon(
                  Icons.trending_up,
                  color: color,
                );
              }
            },
          ),
        ],
      ),
    )
      ),
    );
  }
}