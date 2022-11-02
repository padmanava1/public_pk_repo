

import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

class Uninitialized extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Authenticated extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Unauthenticated extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateInitial extends BaseState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => null;
}

class StateLoading extends BaseState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => null;
}

class StateNoData<T> extends BaseState {
  String? msg;

  StateNoData({this.msg});

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}

class StateShowSearching extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateSearchResult<T> extends BaseState {
  T response;

  StateSearchResult(this.response);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateInternetError extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateError400 extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateErrorServer extends BaseState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateOnSuccess<T> extends BaseState {
  final T? response;
  final bool? flag;

  StateOnSuccess({this.response, this.flag});

  @override
  // TODO: implement props
  List<Object?> get props => [response,flag];

   StateOnSuccess copyWith({ T? response, bool? flag}){
     return StateOnSuccess(response:response??this.response, flag:flag??this.flag);
   }


}

class ValidationError extends BaseState {
  String errorMessage;

  ValidationError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateErrorGeneral extends BaseState {
  String errorMessage;

  StateErrorGeneral(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}