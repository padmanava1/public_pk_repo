import 'package:breaking_bad_practise/breaking_bad/presentation/pages/homepage.dart';
import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, BaseState>(
      listener: (context, state) async {
        if (state is StateNoData) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      child: const Scaffold(
          body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      )),
    );
  }
}
