

import 'package:news_application/news_app/data/models/HeadlinesModel.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {

}

class StateOnSuccess<r> extends NewsState {
  final r headlist;
  StateOnSuccess({required this.headlist});
  @override
  List<Object?> get props => [headlist];
}

class StateErrorListGeneral extends NewsState{
  final List<String> errorMessage;

  StateErrorListGeneral(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}