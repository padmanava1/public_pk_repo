import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/travel.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text('World Travel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text('Book tickets of any transportation and travel the world!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
