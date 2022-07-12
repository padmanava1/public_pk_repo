import 'package:flutter/material.dart';
import 'package:mmt_project/Widgets/continue_button.dart';
import 'package:mmt_project/Widgets/termsAndPrivacy.dart';
import 'package:mmt_project/Widgets/text_field.dart';

class SignUpOneView extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conPass = TextEditingController();

  SignUpOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          SizedBox(
            height: 30,
          ),
          Text(
            'Sign Up',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldView(
            hintTextvar: ' Full Name', textFieldViewController: fullname.text,
          ),
          TextFieldView(
            hintTextvar: ' Email', textFieldViewController: email.text,
          ),
          TextFieldView(
            hintTextvar: ' Password',
            textFieldViewController: pass.text,
          ),
          TextFieldView(
            hintTextvar: ' Confirm Password',
            textFieldViewController: conPass.text,
          ),
          SizedBox(
            height: 10,
          ),
          ContinueButton(),
          SizedBox(
            height: 10,
          ),
          Text(
            'By signing up, you agree to our ',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          TermsAndPrivacyButton(),
        ],
      ),
    )));
  }
}
