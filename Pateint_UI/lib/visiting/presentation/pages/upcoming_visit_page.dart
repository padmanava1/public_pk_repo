import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';
import 'package:pateint_ui/visiting/injection_container.dart';
import 'package:pateint_ui/visiting/presentation/pages/visits_page.dart';
import 'package:pateint_ui/utils/default_theme.dart';
import 'package:pateint_ui/widgets/custom_button.dart';

import '../cubit/bottom_nav_bar_cubit.dart';
import '../cubit/bottom_nav_bar_state.dart';
import '../cubit/upcoming_visit_page_cubit.dart';
import '../cubit/upcoming_visit_page_state.dart';
import 'package:intl/intl.dart';

class UpcomingVisitPage extends StatelessWidget {
  UpcomingVisitPage({Key? key}) : super(key: key);

  VisitingModel? stateResponse;

  @override
  Widget build(BuildContext context) {
    var cubit = sl<UpcomingVisitPageCubit>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Image(
              height: 50,
              width: 50,
              image: const AssetImage('graphics/op-logo.png')),
          actions: [
            SizedBox(
              width: 60,
              child: Stack(
                alignment: Alignment.centerRight,
                children: const [
                  Positioned(
                      left: 10,
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('graphics/Ellipse 3.png'))),
                  //Image.asset('graphics/Ellipse 3.png',)), // Back image
                  Positioned(
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('graphics/Ellipse 4.png'))),
                  // Front image
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: DefaultTheme.textHeadlineColor,
                size: 30,
              ),
            )
          ],
        ),
        body: BlocBuilder<UpcomingVisitPageCubit, UpcomingVisitPageState>(
          builder: (context, state) {
            print(state);
            if (state is UpcomingVisitSuccessState) {
              stateResponse = state.upcomingVisitList;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Stack(alignment: Alignment.center, children: const [
                        Positioned(
                            child: Image(
                                image: AssetImage(
                                    'graphics/Background Pattern@4x.png'))),
                        Positioned(
                            child: Image(
                          image: AssetImage('graphics/Ellipse 2.png'),
                          height: 140,
                        )),
                      ]),
                      Text(
                        stateResponse!.patientname!,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 20.0),
                              child: Text('UpComing Visit',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Theme(
                              data: ThemeData(dividerColor: Colors.transparent)
                                  .copyWith(
                                      primaryColor: DefaultTheme.primaryColor),
                              child: ExpansionTile(
                                onExpansionChanged: (value) {
                                  cubit.isExpanded = value;
                                  //value = val!;
                                  //val = value;
                                  BlocProvider.of<UpcomingVisitPageCubit>(
                                          context)
                                      .arrowTapped(value);
                                },
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text('UpComing Visit',style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                          DateFormat('EEE , d MMM, yyyy , h:mm a').format( stateResponse!.visitDateTime!.toUtc()),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        'Established sick visit',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        "${stateResponse?.doctorName}, ${stateResponse?.doctorQualification}",
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        'Main Street Pediatrics',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                leading: const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Icon(
                                    Icons.account_circle_rounded,
                                    size: 55,
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: cubit.isExpanded
                                      ? const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 36,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 24,
                                        ),
                                ),
                                // controlAffinity: ListTileControlAffinity.values.first,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          stateResponse!.doctorName!,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Established sick visit',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          DateFormat('EEE , d MMM, yyyy , h:mm a').format( stateResponse!.visitDateTime!.toUtc()),
                                          style: const TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            stateResponse!.doctorAddress!
                                                .substring(0, 22),
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CustomButton(
                                  buttonColor: DefaultTheme.primaryColor,
                                  buttonText: "Check IN",
                                  buttonTextColor: DefaultTheme.backgroundColor,
                                  callBack: () {
                                    BlocProvider.of<BottomNavBarCubit>(context)
                                        .setId(stateResponse?.id ?? '');
                                    BlocProvider.of<BottomNavBarCubit>(context)
                                        .onTapOfNavButton(1);
                                  },
                                  height: 50,
                                  width: double.infinity),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // print(':::::::::::::::::::::::::::::::${state.response.toJson()}');
            } else if (state is ServerFailure) {
              return const Center(
                  child: Text(
                'Server Failure',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ));
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          },
        ));
  }
}
