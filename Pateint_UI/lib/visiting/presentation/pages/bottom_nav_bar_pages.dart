import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bottom_nav_bar_cubit.dart';
import '../cubit/bottom_nav_bar_state.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<BottomNavBarCubit>(context);
        bool willPop = false;
        return WillPopScope(
          onWillPop: () async {
            if (cubit.pageIndex != 0) {
              cubit.pageIndex = cubit.pageIndex - 1;
              cubit.onTapOfNavButton(cubit.pageIndex);
              willPop = false;
            } else if (cubit.pageIndex == 0) {
              willPop = true;
            }
            return willPop;
          },
          child: Scaffold(
            body: cubit.returnPage(),
            bottomNavigationBar: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          cubit.onTapOfNavButton(0);
                        },
                        icon: Icon(
                          Icons.home_outlined,
                          color: cubit.pageIndex == 0
                              ? Colors.blue
                              : Colors.blueGrey,
                          size: 26,
                        ),
                      ),
                      Text('Home',
                          style: TextStyle(
                            color: cubit.pageIndex == 0
                                ? Colors.blue
                                : Colors.blueGrey,
                          ))
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          cubit.onTapOfNavButton(1);
                        },
                        icon: Icon(
                          Icons.calendar_month_sharp,
                          color: cubit.pageIndex == 1
                              ? Colors.blue
                              : Colors.blueGrey,
                          size: 26,
                        ),
                      ),
                      Text('Visits',
                          style: TextStyle(
                            color: cubit.pageIndex == 1
                                ? Colors.blue
                                : Colors.blueGrey,
                          ))
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          cubit.onTapOfNavButton(2);
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: cubit.pageIndex == 2
                              ? Colors.blue
                              : Colors.blueGrey,
                          size: 26,
                        ),
                      ),
                      Text(
                        'More',
                        style: TextStyle(
                          color: cubit.pageIndex == 2
                              ? Colors.blue
                              : Colors.blueGrey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// 2nd page

// 3rd page
