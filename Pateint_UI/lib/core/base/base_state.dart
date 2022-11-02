

abstract class BaseState {}

class Uninitialized extends BaseState {}

class Authenticated extends BaseState {}

class Unauthenticated extends BaseState {}

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

class StateNoData extends BaseState {}

class StateShowSearching extends BaseState {}

class StateSearchResult<T> extends BaseState {
  T response;

  StateSearchResult(this.response);
}

class StateInternetError extends BaseState {}

class StateError400 extends BaseState {}

class StateErrorServer extends BaseState {}

class StateOnSuccess<T> extends BaseState {
  T response;

  StateOnSuccess(this.response);
}

class ValidationError extends BaseState {
  String errorMessage;

  ValidationError(this.errorMessage);
}

class StateErrorGeneral extends BaseState {
  String errorMessage;

  StateErrorGeneral(this.errorMessage);
}