import 'dart:io';

import 'package:breaking_bad_api/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:breaking_bad_api/breaking_bad/presentation/widgets/custom_widget.dart';
import 'package:breaking_bad_api/postapipage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BreakingBadCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        //home:  CreateStudent(), //for Post method using Node Api of Students from day 6 Assignment
        home:  MyHomePage() //for BreakingBadApi
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Breaking Bad API '),),
      body: BlocBuilder<BreakingBadCubit, BreakingBadState >(
        builder: (context, state) {
          if(state is BreakingBadSuccessState){

            return ListView.builder(
                itemCount: state.breakinglist.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: Image.network(state.breakinglist[index].img.toString()),
                    title: Text("${state.breakinglist[index].name}"),
                  );
                });
          }
          else{
            //return CircularProgressIndicator();
            return ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) => ShimmerWidget());
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<BreakingBadCubit>(context).getAllCharacter();
        },
        child: Icon(Icons.adb),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomWidget.square(),
      title: Align(
        alignment: Alignment.centerLeft,
        child: CustomWidget.rectangular(height: 10,
          width: MediaQuery.of(context).size.width*0.3,),
      ),
    );
  }
}
