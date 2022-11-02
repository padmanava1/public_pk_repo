import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upcoming_visit_page_cubit.dart';
import '../cubit/visits_cubit.dart';
import '../utils/default_theme.dart';
import 'custom_button.dart';

class VisitsListTile extends StatelessWidget {
  VisitsListTile({Key? key, required this.index, }) : super(key: key);
  int index;
  //bool isTileExpanded;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VisitsCubit>(context);
    return BlocBuilder<VisitsCubit, VisitsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: index != 0 ? false : true,
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0, top: 20.0),
                child: Text('UpComing Visit',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Theme(
              data: ThemeData(dividerColor: Colors.transparent).copyWith(primaryColor: DefaultTheme.primaryColor),
              child: ExpansionTile(
                onExpansionChanged: (value) {
                  //isTileExpanded = !isTileExpanded;
                  cubit.isListTileExpanded = !cubit.isListTileExpanded;
                  BlocProvider.of<VisitsCubit>(context)
                      .listTileArrowTapped(value, index);
                },
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Text('UpComing Visit',style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'Mon, Nov 25, 10:30 AM',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'Established sick visit',
                        style:
                        TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'Elissa Thomas, MD',
                        style:
                        TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'Main Street Pediatrics',
                        style:
                        TextStyle(fontSize: 18, color: Colors.grey),
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
                  child: state is ListTileExpandedState && index == state.index
                      ? const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 85.0),
                        child: Container(
                          height: 70,
                          color: Colors.green[100],
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.train_outlined,
                                size: 30,
                              ),
                              Text(
                                'Have you arrived?',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 40,
                                width: 80,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.green[900],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  child: Center(
                                      child: Text(
                                        "I'm here",
                                        style:
                                        TextStyle(color: Colors.white),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: index != 0 ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 84.0, top: 6.0),
                      child: CustomButton(
                          buttonColor: DefaultTheme.primaryColor,
                          buttonText: "Check IN",
                          buttonTextColor: DefaultTheme.backgroundColor,
                          callBack: () {},
                          height: 40,
                          width: double.infinity),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
