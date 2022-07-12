part of 'calender_cubit.dart';

@immutable
abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class Success extends CalenderState{}

class Error extends CalenderState{}

class DateSelected extends CalenderState{

}
