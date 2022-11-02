import 'package:flutter/material.dart';

import '../utils/default_theme.dart';


class CustomDropDownWidget extends StatefulWidget {
  late final String dropdownvalue;
  final List<String> itemsList;
  void Function(String? val) callBack;

  CustomDropDownWidget(
      {Key? key, required this.dropdownvalue, required this.itemsList, required this.callBack})
      : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(widget.dropdownvalue),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: DefaultTheme.inputBorderColor),
            borderRadius: BorderRadius.circular(4),
          ),
          // ),
          filled: true,
          fillColor: DefaultTheme.backgroundColor),
      onChanged: widget.callBack
         // (String? newValue) {
        // setState(() {
        //   widget.dropdownvalue = newValue!;
        // });
      //}
      ,
      items: widget.itemsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
