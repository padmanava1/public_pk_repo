import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final double height;
  final double width;
  final VoidCallback callBack;

  const CustomButton(
      {Key? key,
        required this.buttonColor,
        required this.buttonText,
        required this.buttonTextColor,
        required this.callBack, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(60))),
          child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: buttonTextColor),
              ))),
    );
  }
}
