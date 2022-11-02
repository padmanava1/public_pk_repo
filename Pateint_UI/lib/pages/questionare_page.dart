import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/pages/upcoming_visit_page.dart';
import '../cubit/questionare_cubit.dart';
import '../utils/app_localizations.dart';
import '../utils/default_theme.dart';
import '../utils/localization_key.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down_widget.dart';
import '../widgets/radio_widget.dart';


class QuestionarePage extends StatelessWidget {

  List<String> itemsList = ["item1", "item2", "item3", "item4"];
   QuestionarePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[700]),
            ),
          ),
        ),
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
              'Questionare',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: BlocBuilder<QuestionareCubit, QuestionareState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<QuestionareCubit>(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kids Asthma Check \nAges 1-8"
                    ,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      "When walking or playing hard with friends,\nmy child has trouble breather or coughs.",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  RadioWidget(
                    val: question1.Yes.name,
                    callback: (String? value) {
                      // setState(() {
                      //   groupValueYesNo = value.toString();
                      // });
                      cubit.setYesNoRadioValue(value!);
                    },
                    groupValue: cubit.groupValue1,
                  ),
                  RadioWidget(
                    val: question1.No.name,
                    callback: (String? value) {
                      // setState(() {
                      //   groupValueYesNo = value.toString();
                      // });
                      cubit.setYesNoRadioValue(value!);
                    },
                    groupValue: cubit.groupValue1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "When walking up hills or stairs, my child has\ntrouble breathing or coughs",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomDropDownWidget(
                    dropdownvalue: cubit.dropdownvalue1,
                    itemsList: itemsList,
                    callBack: (String? val) {
                      cubit.setDropDownValue1(val!);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      "When running or playing sports, my child has\ntrouble breathing or coughs.",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomDropDownWidget(
                    dropdownvalue: cubit.dropdownvalue2,
                    itemsList: itemsList,
                    callBack: (String? val) {
                      cubit.setDropDownValue2(val!);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      "When did you noticed your child having\nbreathing trouble.",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomDropDownWidget(
                    dropdownvalue: cubit.dropdownvalue3,
                    itemsList: itemsList,
                    callBack: (String? val) {
                      cubit.setDropDownValue3(val!);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      "Who filled out this survey?",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  RadioWidget(
                      val: question2.Mother.name,
                      groupValue: cubit.groupValue2,
                      callback: (String? value) {
                        cubit.setWhoFilledOutRadioValue(value!);
                      }),
                  RadioWidget(
                      val: question2.Father.name,
                      groupValue: cubit.groupValue2,
                      callback: (String? value) {
                        cubit.setWhoFilledOutRadioValue(value!);
                      }),
                  RadioWidget(
                      val: question2.Both_Parents.name.replaceAll("_", " "),
                      groupValue: cubit.groupValue2,
                      callback: (String? value) {
                        cubit.setWhoFilledOutRadioValue(value!);
                      }),
                  RadioWidget(
                      val: question2.Patient.name,
                      groupValue: cubit.groupValue2,
                      callback: (String? value) {
                        cubit.setWhoFilledOutRadioValue(value!);
                      }),
                  RadioWidget(
                      val: question2.Others.name,
                      groupValue: cubit.groupValue2,
                      callback: (String? value) {
                        cubit.setWhoFilledOutRadioValue(value!);
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      buttonColor: DefaultTheme.primaryColor,
                      buttonText: 'Save',
                      buttonTextColor: DefaultTheme.backgroundColor,
                      callBack: () {
                        print(cubit.groupValue1);
                        print(cubit.dropdownvalue1);
                        print(cubit.dropdownvalue2);
                        print(cubit.dropdownvalue3);
                        print(cubit.groupValue2);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpcomingVisitPage()));
                      },
                      height: 55.0,
                      width: double.infinity)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
