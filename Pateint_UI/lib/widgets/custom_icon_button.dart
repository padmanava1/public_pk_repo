import 'package:flutter/material.dart';

import '../utils/default_theme.dart';

class CustommIconButton extends StatelessWidget {
   CustommIconButton({Key? key, required this.text, required this.icon}) : super(key: key);

  IconData icon;
  String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:  [
        CircleAvatar(
          radius: 26,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                icon,
                size: 28,
              )),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(text,style: TextStyle(color: DefaultTheme.primaryColor,fontSize: 18),),
        ),
      ],
    );
  }
}
