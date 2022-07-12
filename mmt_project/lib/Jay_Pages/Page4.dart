import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/resort.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text('Attractive Resorts',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text('Come and explore our attractive resort packages.'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
