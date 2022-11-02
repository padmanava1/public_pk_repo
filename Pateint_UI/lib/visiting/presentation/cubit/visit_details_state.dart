part of 'visit_details_cubit.dart';

abstract class VisitDetailsState extends Equatable {
  const VisitDetailsState();
}

class VisitDetailsInitial extends VisitDetailsState {
  @override
  List<Object> get props => [];
}

class VisitDetailsSuccessState extends VisitDetailsState {
  VisitingModel? visitDetails;
  bool? updateFlag;

  VisitDetailsSuccessState({
    this.visitDetails,
    this.updateFlag,
  });

  VisitDetailsSuccessState copyWith({
    VisitingModel? visitDetails,
    bool? updateFlag,
  }) =>
      VisitDetailsSuccessState(
          visitDetails: visitDetails ?? this.visitDetails,
          updateFlag: updateFlag ?? this.updateFlag);

  @override
  List<Object?> get props => [visitDetails, updateFlag];
}
