import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visits_cubit.dart';
import 'package:pateint_ui/utils/default_theme.dart';
import 'package:pateint_ui/visiting/presentation/pages/visit_details_page.dart';

import '../../injection_container.dart';
import '../cubit/bottom_nav_bar_cubit.dart';
import '../cubit/bottom_nav_bar_state.dart';
import '../cubit/upcoming_visit_page_cubit.dart';
import '../../../widgets/visits_list_tile.dart';
import '../cubit/visits_state.dart';
import 'package:intl/intl.dart';

class VisitsPage extends StatelessWidget {
  VisitsPage(this.id, {Key? key}) : super(key: key);
  final String id;
  List<VisitingModel>? stateResponse;

  @override
  Widget build(BuildContext context) {
    //print(id);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leadingWidth: 80,
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
                'Visits',
                style: TextStyle(fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ),
        body: BlocBuilder<VisitsCubit, VisitsState>(
          builder: (context, state) {
            if (state is AllVisitsSuccessState) {
              stateResponse = state.allVisitsList;
              // print(
              //     ':::::::::::::::::::::::::::::::${state.allVisitsList![0].toJson()}');
            } else if (state is ListTileExpandedState) {
              //val = state.value;
              print(':::::::::::::::::::::::::::::::${state.value}');
            } else {
              return Center(child: const CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 12.0,
              ),
              child: ListView.builder(
                  itemCount: stateResponse!.length,
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => sl<VisitsCubit>(),
                      child: VisitsListTile(
                        index: index,
                        callBack: () {
                          BlocProvider.of<BottomNavBarCubit>(context)
                              .onTapOfNavButton(2);
                        },
                        docName: stateResponse![index]!.doctorName!,
                        docAddress: stateResponse![index]!.doctorAddress!,
                        visitingDate:DateFormat('EEE , d MMM, yyyy ,\nh:mm a').format( stateResponse![index]!.visitDateTime!).toString(),
                        id: stateResponse![index]!.id!,
                        // isTileExpanded: false,
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
