import 'package:flutter/material.dart';
import 'package:pateint_ui/utils/default_theme.dart';
import 'package:pateint_ui/widgets/custom_button.dart';
import 'package:pateint_ui/widgets/green_container_widget.dart';

import '../widgets/custom_icon_button.dart';

class VisitDetails extends StatelessWidget {
   VisitDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            Image(
                height: 24,
                width: 24,
                image: AssetImage('graphics/ellipse.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              'Visit Details',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Established sick visit',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Monday, November 25 at 10:30 AM',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 14.0, bottom: 14.0),
                child: GreenContainerWidget(
                    height: 60.0,
                    color: Colors.green[50]!,
                    buttonHeight: 40.0,
                    buttonText: "I'm here",
                    buttonWidth: 80.0,
                    iconSize: 30.0,
                    text: "Have you arrived?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:    [
                  CustommIconButton(icon: Icons.map,text: "Directions",),
                  CustommIconButton(icon: Icons.call,text: "Call",),
                  CustommIconButton(icon: Icons.close,text: "Cancel",),
                ],
              ),
              SizedBox(height: 10,),
              Text('Patient',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(height:50,width:50,image: AssetImage('graphics/ellipse.png')),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Jack Johnson',style: TextStyle(fontSize: 18)),
                    Text('Date of birth: 1/2/2020',style: TextStyle(color: Colors.grey,fontSize: 16),)
                  ],
                )
              ],),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: const Text('Who you’re seeing',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10,),
              Row(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle_rounded,size: 50,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Elissa Thomas, MD',style:TextStyle(fontSize: 18,)),
                    Text('Main Street Pediatrics',style: TextStyle(color: Colors.grey,fontSize: 16),),
                    Text('1234 Main Street, Culver City, CA 90210',style: TextStyle(color: Colors.grey,fontSize: 16),)
                  ],
                )
              ],),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('By clicking continue I acknowledge I am an authorized user and have legal authority to view/submit protected health information',
                    style: TextStyle(fontSize: 18)),
              ),
              CustomButton(buttonColor: DefaultTheme.primaryColor, buttonText: "Continue", buttonTextColor: Colors.white, callBack: (){}, height: 50, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
