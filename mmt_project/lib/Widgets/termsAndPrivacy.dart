import 'package:flutter/material.dart';

class TermsAndPrivacyButton extends StatelessWidget {
  const TermsAndPrivacyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: const Text("Terms & Privacy",style: TextStyle(color: Colors.blue),),
        onTap: () {},
      ),
    );
  }
}
