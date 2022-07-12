import 'package:flutter/material.dart';
import 'package:mmt_project/Pages/selectDatePage.dart';

class SelectCheckOutDateInCalender extends StatelessWidget {
  const SelectCheckOutDateInCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCalender(dateType: 'Select Check-Out Date',),
    );
  }
}