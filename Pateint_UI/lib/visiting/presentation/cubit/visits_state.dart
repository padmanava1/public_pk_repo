part of 'visits_cubit.dart';

@immutable
abstract class VisitsState {}

class VisitsInitial extends VisitsState {}

class ListTileUnExpandedState extends VisitsState {
  bool value;
  int index;
  ListTileUnExpandedState(this.value,this.index);
}

class ListTileExpandedState extends VisitsState {
  bool value;
  int index;

  ListTileExpandedState(this.value, this.index,);
}