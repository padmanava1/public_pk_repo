import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/VisitingModel.dart';

@immutable
abstract class UpcomingVisitPageState extends Equatable {}

class UpcomingVisitPageInitial extends UpcomingVisitPageState {
  @override
  List<Object?> get props => [];
}

class UpcomingVisitSuccessState extends UpcomingVisitPageState {
  final VisitingModel? upcomingVisitList;
  final bool? updateFlag;

  UpcomingVisitSuccessState({this.upcomingVisitList, this.updateFlag});

  UpcomingVisitSuccessState copyWith({
    VisitingModel? upcomingVisitList,
    bool? updateFlag,
  }) =>
      UpcomingVisitSuccessState(
          upcomingVisitList: upcomingVisitList ?? this.upcomingVisitList,
          updateFlag: updateFlag ?? this.updateFlag);

  @override
  List<Object?> get props => [upcomingVisitList, updateFlag];
}
