import 'package:flutter/material.dart';
import 'package:mmt_project/Jay_Pages/page_view_slider.dart';
import 'package:mmt_project/Pages/SignUpOneView.dart';
import 'package:mmt_project/Pages/searchHotelsPage.dart';
import 'package:mmt_project/Pages/selectDatePage.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMT app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:  SignUpOneView(),
      // home:   MyCalender()
         home:  SearchHotelspage()

    );
  }
}



