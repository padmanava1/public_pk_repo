import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mmt_project/Pages/selectCheckinDateInCalender.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

class CheckInDateContainerInCalender extends StatelessWidget {

  final calender = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      initialDateSelected: DateTime.now() ,
      endDateSelected: DateTime.now().add(const Duration(days: 1)),

  );
  CheckInDateContainerInCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400)
          ),
          child: Row(
            children:  [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.calendar_today_outlined,color: Colors.grey,),
              ),
              RichText(text: TextSpan(text: "CHECK-IN DATE  \n",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),
                  children: [TextSpan(
                      text:"${calender.initialDateSelected?.day} ${DateFormat("MMMM").format(calender.initialDateSelected as DateTime).substring(0,3)}  ",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),
                      children: [TextSpan(
                          text: "'${calender.initialDateSelected?.year.toString().substring(2)}, ${DateFormat('EEEE').format(calender.initialDateSelected as DateTime).substring(0,3)}",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.normal)
                      )]
                  )]
              )
              )

            ],
          ),
        ),
      ),
    );
  }
}
