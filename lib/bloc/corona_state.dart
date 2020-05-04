part of 'corona_bloc.dart';

abstract class CoronaState extends Equatable {
  const CoronaState();
  
  @override
  List<Object> get props => null;
}

class CoronaEmpty extends CoronaState {}

class CoronaLoading extends CoronaState {}

class CoronaLoaded extends CoronaState {
  final List<Result> resList;
  final Map<String, double> latest;
  const CoronaLoaded({@required this.resList, @required this.latest}) : assert(resList != null), assert(latest != null);

  @override
  List<Object> get props => [resList];
}

class CoronaError extends CoronaState {}