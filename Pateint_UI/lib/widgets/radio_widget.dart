import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  late String val;
  String groupValue;
  Function(String? value) callback;

  RadioWidget({Key? key, required this.val, required this.groupValue, required this.callback})
      : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: widget.val,
          groupValue: widget.groupValue,
          onChanged: widget.callback,
        ),
        Text(widget.val,style: TextStyle(fontSize: 16),),
      ],
    );
  }
}
