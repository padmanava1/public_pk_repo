

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mmt_project/Widgets/checkInDateContainerIncalender.dart';
import 'package:mmt_project/Widgets/checkInDetailsWidget.dart';
import 'package:mmt_project/Widgets/checkOutDateContainerInCalender.dart';
import 'package:mmt_project/Widgets/checkOutDetailsWidget.dart';
import 'package:mmt_project/calender_cubit/calender_cubit.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class MyCalender extends StatelessWidget {
  final String dateType;

  final DateTime today = DateTime.now();
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),


  onRangeSelected: (firstDate, secondDate) {
      // context.read<CalenderCubit>().dateSelect(firstDate, secondDate);
    var datedate = firstDate.day.toString();

    var dateMonth = DateFormat("MMMM").format(firstDate).substring(0,3);
    var dateYear = firstDate.year.toString().substring(2);
    var dateDay = DateFormat('EEEE').format(firstDate).substring(0,3);
    // return datedate;
    //return "${datedate} ${dateMonth} '${dateYear}, ${dateDay}";
    print("${datedate} ${dateMonth} '${dateYear}, ${dateDay}");
    },


    onDayTapped: (date) {
      //print(date.day.toString());
      var datedate = date.day.toString();
      var dateMonth = DateFormat("MMMM").format(date).substring(0,3);
      var dateYear = date.year.toString().substring(2);
      var dateDay = DateFormat('EEEE').format(date).substring(0,3);
      print("${datedate} ${dateMonth} '${dateYear}, ${dateDay}");
    },
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    initialDateSelected: DateTime.now() ,
    endDateSelected: DateTime.now().add(const Duration(days: 1)),
  );

   MyCalender({super.key, required this.dateType});

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      title: 'Scrollable Clean Calendar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.blue,

          //primaryVariant: Color(0xFF002984),
          secondary: Color(0xFFD32F2F),
          //secondaryVariant: Color(0xFF9A0007),
          surface: Color(0xFFDEE2E6),
          background: Color(0xFFF8F9FA),
          error: Color(0xFF96031A),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(onTap:(){
            Navigator.of(context).pop(true);
          },child: const Icon(Icons.arrow_back,color: Colors.black,)),
          title: Text(dateType,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
          actions: [ GestureDetector(
            onTap: (){
              calendarController.clearSelectedDates();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(child: Text('CLEAR',style: TextStyle(color: Colors.blue),)),
            ),
          ),],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400)
                ),
                child: ScrollableCleanCalendar(

                  calendarController: calendarController,
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400)
                ),
                child: Column(
                    children: [
                      SizedBox(height: 6,),
                      Row(children: [
                        Expanded(
                          flex: 2,
                          child: CheckInDateContainerInCalender(),
                        ),
                        Expanded(
                          flex: 2,
                          child: CheckOutDateContainerInCalender(),
                        )
                      ],
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          child: ElevatedButton(onPressed: (){}, child: Text('DONE',style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // <-- Radius
                              ),


                            ) ,),
                        ),
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}