part of 'questionare_cubit.dart';

abstract class QuestionareState extends Equatable {
  const QuestionareState();
}

class QuestionareInitial extends QuestionareState {
  @override
  List<Object> get props => [];
}

class QuestionareFormSuccess extends QuestionareState{

  final bool updateFlag;

  QuestionareFormSuccess({this.updateFlag=false});

  @override
  List<Object?> get props => [updateFlag];

  QuestionareFormSuccess copyWith({bool? update}){
    return QuestionareFormSuccess(
        updateFlag: update ?? updateFlag
    );
  }

}
