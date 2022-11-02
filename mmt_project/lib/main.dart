import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mmt_project/Jay_Pages/page_view_slider.dart';
import 'package:mmt_project/Pages/SignUpOneView.dart';
import 'package:mmt_project/Pages/gallery_page.dart';
import 'package:mmt_project/Pages/myBookingPage.dart';
import 'package:mmt_project/Pages/privacyAndSecurity.dart';
import 'package:mmt_project/Pages/require_login_page.dart';
import 'package:mmt_project/Pages/review_page.dart';
import 'package:mmt_project/Pages/searchHotelsPage.dart';
import 'package:mmt_project/Pages/selectDatePage.dart';

import 'Pages/ReviewNew.dart';

void main() {
  runApp(  MyApp());
  HttpOverrides.global = MyHttpOverrides();
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
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
      //   home:  SearchHotelspage()
      //home: ReviewPage(),
      home:MyBookingPage(),
      //NewReview(),

     // home:
      //PrivacyAndSecurity()
        //AboutUs()
      //RequiredLoginPage()
      //GalleryPage(),

    );
  }
}



