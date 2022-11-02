

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/VisitingModel.dart';

@immutable
abstract class VisitsState extends Equatable{}

class VisitsInitial extends VisitsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListTileUnExpandedState extends VisitsState {
  bool value;
  int index;
  ListTileUnExpandedState(this.value,this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListTileExpandedState extends VisitsState {
  bool value;
  int index;

  ListTileExpandedState(this.value, this.index,);

  @override
  // TODO: implement props
  List<Object?> get props => [value, index];
}

// class StateOnSuccess<T> extends VisitsState {
//   final T response;
//
//   StateOnSuccess(this.response,);
//
//   @override
//   List<Object?> get props => [response];
// }

class AllVisitsSuccessState extends VisitsState{
  final List<VisitingModel>? allVisitsList;
  final bool? updateFlag;

  AllVisitsSuccessState({ this.allVisitsList, this.updateFlag});


  AllVisitsSuccessState copyWith({
    List<VisitingModel>? allVisitsList,
    bool? updateFlag,
  }) =>
      AllVisitsSuccessState(
          allVisitsList: allVisitsList ?? this.allVisitsList,
          updateFlag: updateFlag ?? this.updateFlag);

  @override
  List<Object?> get props => [allVisitsList,updateFlag];

}