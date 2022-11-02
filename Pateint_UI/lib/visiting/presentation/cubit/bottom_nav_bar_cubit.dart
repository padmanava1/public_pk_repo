import 'dart:ffi';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../pages/upcoming_visit_page.dart';
import '../pages/visit_details_page.dart';
import '../pages/visits_page.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int pageIndex = 0;
  String id = '';

  returnPage() {
    if (pageIndex == 1) {
      print(":::Visitinggg...");
      return VisitsPage(id);
    } else if (pageIndex == 2) {
      print(":::Details...");
      return VisitDetails();
    } else if (pageIndex == 0) {
      print(":::UpcomingVisit...");
      return UpcomingVisitPage();
    }
  }

  onTapOfNavButton(int val) {
    pageIndex = val;
    emit(SelectedNewPage(pageIndex));
  }

  void setId(String visitId) {
    id = visitId;
  }
}
