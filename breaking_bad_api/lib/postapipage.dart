import 'package:breaking_bad_api/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:breaking_bad_api/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateStudent extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
   CreateStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Post API'),),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter name' ,
              enabledBorder: OutlineInputBorder(),
              ),
              controller: name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter address' ,
                enabledBorder: OutlineInputBorder(),
              ),
              controller: address,
            ),
          ),
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(onPressed: (){
                 print('Success');
                 BlocProvider.of<BreakingBadCubit>(context).addStudents(name.text, address.text);
               },
                   child: Text('Insert Data')),
               SizedBox(width: 10,),
               ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ViewPage()));

               }, child: Text('Go To View page'))
             ],
           )
        ],
      )
    ));
  }
}
