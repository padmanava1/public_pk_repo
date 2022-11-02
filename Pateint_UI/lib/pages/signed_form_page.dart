
import 'package:flutter/material.dart';
import 'package:pateint_ui/pages/questionare_page.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/custom_button.dart';

class SignedPage extends StatefulWidget {
  String signedByValue;
  String signatureValue;
  bool checkedValue;
   SignedPage({Key? key, required this.checkedValue, required this.signatureValue, required this.signedByValue}) : super(key: key);

  @override
  State<SignedPage> createState() => _SignedPageState();

}

class _SignedPageState extends State<SignedPage> {
  @override
  Widget build(BuildContext context) {
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
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(top:4.0),
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
                  const Text('  Please review and sign the folowing form',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  const SizedBox(
                    height: 26,
                  ),
                  Card(
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:  SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text('Form displayed here',style: TextStyle(fontSize: 20),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("The form was signed by :${widget.signedByValue}",style: TextStyle(fontSize: 20,color: Colors.red)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Gurdian/parent signature ${widget.signatureValue}",style: TextStyle(fontSize: 20,color: Colors.green)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Checked box value: ${widget.checkedValue.toString()}",style: TextStyle(fontSize: 20,color: Colors.purple)),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_rounded,color: Colors.green[800],),
                        const Text(
                         'This form has been signed',
                         style: TextStyle(
                             fontWeight: FontWeight.w400,
                             fontSize: 20),
                  ),
                      ],
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(height: 55,
                          width: 180,callBack: (){
                        Navigator.of(context).pop();
                      }, buttonTextColor: Colors.black, buttonText: 'Back',buttonColor: Colors.grey[300]!),
                      CustomButton(height: 55,
                          width: 180,buttonColor: Colors.blue[700]!, buttonText: 'Next', buttonTextColor: Colors.white, callBack: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  QuestionarePage()));
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
