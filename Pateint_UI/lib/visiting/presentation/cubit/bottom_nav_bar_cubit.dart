import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../pages/bottom_nav_bar_pages.dart';
import '../pages/upcoming_visit_page.dart';
import '../pages/visit_details_page.dart';
import '../pages/visits_page.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int pageIndex = 0;
  Color iconColor = Colors.blueGrey!;
  bool isIconSelectedHome = true;
  bool isIconSelectedCalender = false;
  bool isIconSelectedMore = false;


  final pages = [
    const UpcomingVisitPage(),
    const VisitsPage(),
     VisitDetails(),
  ];

  onTapOfNavButton(int val) {
    emit(SelectedNewPage(val));
    // bottomNavBarUpdateUi();
    print(state);
  }

  // changeIconColor(Color val) {
  //   iconColor = val!;
  //   //bottomNavBarUpdateUi();
  //   emit(ChangeIconColor(iconColor));
  //   print(state);
  //   return iconColor;
  // }

    void bottomNavBarUpdateUi() {
    if (state is BottomNavBarSuccess) {
      final success = state as BottomNavBarSuccess;
      emit(success.copyWith(update: !success.updateFlag));
    } else {
      emit(BottomNavBarSuccess(updateFlag: false));
    }
  }
}
