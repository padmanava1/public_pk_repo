import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';


class CheckOutDateContainerInCalender extends StatelessWidget {
  final calender = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    initialDateSelected: DateTime.now() ,
    endDateSelected: DateTime.now().add(const Duration(days: 1)),

  );
   CheckOutDateContainerInCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
        child: Container(
          // margin: const EdgeInsets.all(15.0),
          // padding: const EdgeInsets.all(3.0),
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
              RichText(text: TextSpan(text: "CHECK-OUT DATE  \n",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),
                  children: [TextSpan(
                      text:"${calender.endDateSelected?.day} ${DateFormat("MMMM").format(calender.endDateSelected as DateTime).substring(0,3)}  ",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),
                      children: [TextSpan(
                          text: "'${calender.endDateSelected?.year.toString().substring(2)}, ${DateFormat('EEEE').format(calender.endDateSelected as DateTime).substring(0,3)}",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.normal)
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
