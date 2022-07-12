import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/discount.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text('Holiday Packages',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text('Udaipur is also an ideal destination for a relaxing break.'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
