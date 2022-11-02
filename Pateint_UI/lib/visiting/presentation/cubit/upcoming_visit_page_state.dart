part of 'upcoming_visit_page_cubit.dart';

@immutable
abstract class UpcomingVisitPageState {}

class UpcomingVisitPageInitial extends UpcomingVisitPageState {}

class UnExpandedState extends UpcomingVisitPageState {
  bool value;
  UnExpandedState(this.value);
}

class ExpandedState extends UpcomingVisitPageState {
  bool value;
  ExpandedState(this.value);
}