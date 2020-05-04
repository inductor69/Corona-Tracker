part of 'corona_bloc.dart';

abstract class CoronaEvent extends Equatable {
  const CoronaEvent();
}

class FetchDetails extends CoronaEvent {
  @override
  List<Object> get props => [];
}

class RefreshDetails extends CoronaEvent {
  @override
  List<Object> get props => [];
}
