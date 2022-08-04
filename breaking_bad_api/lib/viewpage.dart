import 'package:breaking_bad_api/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BreakingBadCubit, BreakingBadState >(
        builder: (context, state) {
          if(state is getAllStudentsSuccessState){

            return ListView.builder(
                itemCount: state.studentList.length,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(tileColor: Colors.amberAccent,
                      title: Center(child: Text("Name : ${state.studentList[index].name}")),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Address : ${state.studentList[index].address}"),
                          SizedBox(width: 40,),
                          Row(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: (){},
                                    child: Text('Edit'),

                                  ),
                                  SizedBox(width: 20,),
                                  ElevatedButton(onPressed: (){},
                                    child: Text('Delete'),

                                  ),

                                ],
                              )
                            ],
                          )
                        ],
                      ),


                    ),
                  );
                });
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<BreakingBadCubit>(context).getstudents();
                },
                child: Icon(Icons.refresh_outlined),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       Navigator.pop(context,true);
            //     },
            //     child: Icon(Icons.arrow_back),
            //   ),
            // ),
          ],
        )
    );
  }
}
