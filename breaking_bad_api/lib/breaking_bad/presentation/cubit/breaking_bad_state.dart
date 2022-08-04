part of 'breaking_bad_cubit.dart';

@immutable
abstract class BreakingBadState {}

class BreakingBadInitial extends BreakingBadState {}

class BreakingBadFailedState extends BreakingBadState{}

class BreakingBadSuccessState extends BreakingBadState{
  final List<BreakingBadModel> breakinglist;

  BreakingBadSuccessState({required this.breakinglist});
}

class AddStudentSuccess extends BreakingBadState{
  final List<StudentModel> studentlist;

  AddStudentSuccess({required this.studentlist});
}

class AddStudentFail extends BreakingBadState{

}

class getAllStudentsSuccessState extends BreakingBadState{
  late final List<StudentModel> studentList;

  getAllStudentsSuccessState({required this.studentList});
}

class getAllStudentsFailureState extends BreakingBadState{

}