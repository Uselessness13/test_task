import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:Test_task/fav_gifs/index.dart';

class FavGifsBloc extends Bloc<FavGifsEvent, FavGifsState> {

  FavGifsBloc(FavGifsState initialState) : super(initialState);

  @override
  Stream<FavGifsState> mapEventToState(
    FavGifsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'FavGifsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
