import 'package:flutter/material.dart';

class GreenContainerWidget extends StatelessWidget {
  final height;
  final Color color;
  final iconSize;
  final text;
  final textFontSize;
  final buttonHeight;
  final buttonWidth;
  final buttonText;
  const GreenContainerWidget(
      {Key? key,
      required this.height,
      required this.color,
      required this.buttonHeight,
      required this.buttonText,
      required this.buttonWidth,
      required this.iconSize,
      required this.text,
      this.textFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.train_outlined,
            size: iconSize,
            color: Colors.green[900],
          ),
          Text(
            text,
            style: TextStyle(fontSize: textFontSize),
          ),
          SizedBox(
            height: buttonHeight,
            width: buttonWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Center(
                  child: Text(
                 buttonText,
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
