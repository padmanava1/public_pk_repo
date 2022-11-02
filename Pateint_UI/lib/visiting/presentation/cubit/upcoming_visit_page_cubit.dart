import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pateint_ui/core/failures/failures.dart';
import 'package:pateint_ui/core/usecases/usecase.dart';
import 'package:pateint_ui/visiting/data/models/VisitingModel.dart';
import 'package:pateint_ui/visiting/presentation/cubit/upcoming_visit_page_state.dart';
import '../../domain/use_cases/upcoming_visit_usecase.dart';

class UpcomingVisitPageCubit extends Cubit<UpcomingVisitPageState> {
  UpcomingVisitPageCubit({required this.upcomingVisitUsecase})
      : super(UpcomingVisitPageInitial());

  bool isExpanded = false;
  UpcomingVisitUsecase upcomingVisitUsecase;
  Set idStorage = {};


  arrowTapped(bool value) {
    isExpanded = value;
    updateUi();
  }

  showUpcomingVisit() async {
    var res = await upcomingVisitUsecase.call(NoParams());
    debugPrint('Cubit Success');
    // print(res);
    res.fold((l) {
      return ServerFailure();
    }, (r) {
      emit(UpcomingVisitSuccessState(upcomingVisitList: r));
    });
  }

  void updateUi() {
    if (state is UpcomingVisitSuccessState) {
      final success = state as UpcomingVisitSuccessState;
      emit(success.copyWith(updateFlag: isExpanded ));
    } else {
      emit(UpcomingVisitSuccessState(updateFlag: false));
    }
  }


}
