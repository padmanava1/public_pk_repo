import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_ui/signup/presentation/bloc/sign_up_bloc.dart';

import 'package:signup_ui/signup/presentation/pages/signup_page.dart';
import 'package:signup_ui/signup/signup_injection_Container.dart';
import 'signup/signup_injection_Container.dart' as di;

void main() async{
  await di.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (context) => sl<SignUpCubit>(),
      create: (context) => sl<SignUpBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpPage(),
      ),
    );
  }
}

