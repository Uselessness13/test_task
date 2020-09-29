import 'dart:async';
import 'dart:developer' as developer;

import 'package:rxdart/rxdart.dart';
import 'package:Test_task/data/repos/gif_api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:Test_task/all_gifs/index.dart';

class AllGifsBloc extends Bloc<AllGifsEvent, InAllGifsState> {
  AllGifsBloc(InAllGifsState initialState) : super(initialState);

  @override
  Stream<Transition<AllGifsEvent, InAllGifsState>> transformEvents(
    Stream<AllGifsEvent> events,
    TransitionFunction<AllGifsEvent, InAllGifsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<InAllGifsState> mapEventToState(
    AllGifsEvent event,
  ) async* {
    if (event is ClearGifsEvent) {
      yield await _mapGifsToState(InAllGifsState());
    }
    if (event is LoadAllGifsEvent) {
      yield await _mapGifsToState(state);
    }
  }

  Future<InAllGifsState> _mapGifsToState(InAllGifsState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == GifStatus.initial) {
        final gifs = await GiphyApiRepo().getGifs(0);
        return state.copyWith(
          status: GifStatus.success,
          gifs: gifs,
          hasReachedMax: false,
        );
      }
      final posts = await GiphyApiRepo().getGifs(state.gifs.length);
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: GifStatus.success,
              gifs: List.of(state.gifs)..addAll(posts),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: GifStatus.failure);
    }
  }
}
