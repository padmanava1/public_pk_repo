import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: ElevatedButton(onPressed: (){}, child: Text('Continue',style: TextStyle(fontSize: 18),),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            ),


          ) ,),
      ),
    );
  }
}
