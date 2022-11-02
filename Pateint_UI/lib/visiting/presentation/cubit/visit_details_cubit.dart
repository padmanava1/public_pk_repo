import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/models/VisitingModel.dart';
import '../../domain/use_cases/upcoming_visit_usecase.dart';

part 'visit_details_state.dart';

class VisitDetailsCubit extends Cubit<VisitDetailsState> {
  UpcomingVisitUsecase upcomingVisitUsecase;
  VisitDetailsCubit({required this.upcomingVisitUsecase}) : super(VisitDetailsInitial());



  showVisitDetails() async {
    var res = await upcomingVisitUsecase.call(NoParams());

    res.fold((l) => ServerFailure(),
            (r) => emit(VisitDetailsSuccessState(visitDetails: r)));
  }
}
