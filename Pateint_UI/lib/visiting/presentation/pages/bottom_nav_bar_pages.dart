import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bottom_nav_bar_cubit.dart';
import 'upcoming_visit_page.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<BottomNavBarCubit>(context);
        return Scaffold(
          body: cubit.pages[cubit.pageIndex],
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
                        cubit.pageIndex = 0;
                        cubit.isIconSelectedHome = true;
                        cubit.isIconSelectedCalender = false;
                        cubit.isIconSelectedMore = false;
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .onTapOfNavButton(cubit.pageIndex);
                      },
                      icon: Icon(
                        Icons.home_outlined,
                        color: cubit.isIconSelectedHome
                            ? Colors.blue
                            : Colors.blueGrey,
                        size: 26,
                      ),
                    ),
                    Text('Home',style: TextStyle(color:cubit.isIconSelectedHome
                        ? Colors.blue
                        : Colors.blueGrey, ))
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        cubit.pageIndex = 1;
                        cubit.isIconSelectedHome = false;
                        cubit.isIconSelectedCalender = true;
                        cubit.isIconSelectedMore = false;
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .onTapOfNavButton(cubit.pageIndex);
                      },
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: cubit.isIconSelectedCalender
                                ? Colors.blue
                                : Colors.blueGrey,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                    Text('Visits',style: TextStyle(color:cubit.isIconSelectedCalender
                        ? Colors.blue
                        : Colors.blueGrey, ))
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        cubit.pageIndex = 2;
                        cubit.isIconSelectedHome = false;
                        cubit.isIconSelectedCalender = false;
                        cubit.isIconSelectedMore = true;
                        BlocProvider.of<BottomNavBarCubit>(context)
                            .onTapOfNavButton(cubit.pageIndex);
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: cubit.isIconSelectedMore
                            ? Colors.blue
                            : Colors.blueGrey,
                        size: 26,
                      ),
                    ),
                    Text('More',style: TextStyle(color:cubit.isIconSelectedMore
                        ? Colors.blue
                        : Colors.blueGrey, ),)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// 2nd page


// 3rd page

