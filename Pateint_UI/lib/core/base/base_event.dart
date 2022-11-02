class BaseEvent {}

class AppStarted extends BaseEvent {}

class EventLoading extends BaseEvent {}

class EventNoData extends BaseEvent {}

class EventShowSearching extends BaseEvent {}

class EventError400 extends BaseEvent {}

class EventErrorServer extends BaseEvent {}

class EventInternetError extends BaseEvent {}

class EventUnAuthenticated extends BaseEvent {}

class EventOnSuccess<T> extends BaseEvent {
  T response;
  EventOnSuccess(this.response);
}

class EventRequest<T> extends BaseEvent {
  T request;
  EventRequest(this.request);
}

class EventErrorGeneral extends BaseEvent {
  String errorMessage;
  EventErrorGeneral(this.errorMessage);
}

class EventValidationError extends BaseEvent {
  String errorMessage;
  EventValidationError(this.errorMessage);
}


