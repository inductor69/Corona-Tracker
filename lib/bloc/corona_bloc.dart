import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19/model/result.dart';
import 'package:covid19/repository/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'corona_event.dart';
part 'corona_state.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {

  final CoronaRepository coronaRepository;

  CoronaBloc({
    @required this.coronaRepository
  }) : assert(coronaRepository != null);

  @override
  CoronaState get initialState => CoronaEmpty();

  @override
  Stream<CoronaState> mapEventToState(
    CoronaEvent event,
  ) async* {
    if (event is FetchDetails) {
      yield* _mapFetchDetailsToState(event);
    } else {
      yield* _mapRefreshDetailsToState(event);
    }
  }

  Stream < CoronaState > _mapFetchDetailsToState(FetchDetails event) async*{
    yield CoronaLoading();
    try {
      final List<Result> resList = await coronaRepository.getUpdate();
      final Map<String, double> latest = await coronaRepository.getLatest();      
      yield CoronaLoaded(resList: resList, latest: latest);
    } catch (_) {
      yield CoronaError();
    }
  }

  Stream < CoronaState > _mapRefreshDetailsToState(RefreshDetails event) async*{
    try {
      final List<Result> resList = await coronaRepository.getUpdate();
      final Map<String, double> latest = await coronaRepository.getLatest();
      yield CoronaLoaded(resList: resList, latest: latest);
    } catch (_) {
      yield state;
    }
  }
}
