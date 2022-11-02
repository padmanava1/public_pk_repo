import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/pages/signed_form_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../cubit/sign_forms_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/radio_widget.dart';



class SignFormPage extends StatefulWidget {

  const SignFormPage({Key? key}) : super(key: key);

  @override
  State<SignFormPage> createState() => _SignFormPageState();
}

class _SignFormPageState extends State<SignFormPage> {



  final TextEditingController signature = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var cubit = BlocProvider.of<SignFormsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                height: 24,
                width: 24,
                image: AssetImage('graphics/ellipse.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              'Check in',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 14.0, bottom: 4.0, right: 8.0, left: 0.0),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Finish Later',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[700]),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              StepProgressIndicator(
                totalSteps: 5,
                // total pages
                currentStep: 3,
                // current page
                size: 6,
                // StepProgressIndicator thickness
                padding: 0,
                selectedColor: Colors.blue[800]!,
                unselectedColor: Colors.blue[50]!,
                roundedEdges: const Radius.circular(0),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ' HIPAA notice of privacy',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text('  Please review and sign the following form',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                    const SizedBox(
                      height: 26,
                    ),
                    Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: Image.network(
                              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg',
                              fit: BoxFit.cover,
                            ))),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'This form was signed by ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    BlocBuilder<SignFormsCubit, SignFormsState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            RadioWidget(
                              val: 'Guardian',
                              callback: (String? value) {
                                // setState(() {
                                //   groupValue = value.toString();
                                // });
                                cubit.setRadioValue(value!);
                              },
                              groupValue: cubit.groupValue
                            ),
                            RadioWidget(
                              groupValue: cubit.groupValue,
                              val: groupvalues.Patient.name,
                              callback: (String? value) {
                                // setState(() {
                                //   groupValue = value.toString();
                                // });
                                cubit.setRadioValue(value!);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Signature is empty';
                        }
                      },
                      onChanged: (value) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Gurdian/patient signature",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      controller: signature,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        BlocBuilder<SignFormsCubit, SignFormsState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: cubit.checkValue,
                              onChanged: (bool? value) {
                                cubit.setCheckBoxValue(value!);
                              },
                            );
                          },
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.0),
                            child: Text(
                              'I understand that by typing my name,\nI am electronically signing this form.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                            height: 55,
                            width: 180,
                            callBack: () {},
                            buttonTextColor: Colors.black,
                            buttonText: 'Back',
                            buttonColor: Colors.grey[300]!),
                        CustomButton(
                            buttonColor: Colors.blue[700]!,
                            buttonText: 'Next',
                            buttonTextColor: Colors.white,
                            callBack: () {
                              formKey.currentState!.validate();
                               FocusScope.of(context).unfocus();
                            bool isValid= cubit.checkValidation(signature);
                            if(isValid){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  SignedPage(checkedValue:cubit.checkValue  , signatureValue: signature.text, signedByValue: cubit.groupValue,)));
                              print(signature.text);
                              print(cubit.groupValue);
                              print(cubit.checkValue);

                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form is not validated!')));
                            }
                            }, height: 55,
                          width: 180,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
