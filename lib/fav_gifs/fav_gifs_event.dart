import 'dart:async';
import 'dart:developer' as developer;

import 'package:Test_task/data/models/gif_info.dart';
import 'package:Test_task/data/repos/fav_gif_repo.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavGifsEvent {
  Stream<FavGifsState> applyAsync(
      {FavGifsState currentState, FavGifsBloc bloc});
}

class AddFavGifsEvent extends FavGifsEvent {
  final GifInfo gif;

  AddFavGifsEvent(this.gif);
  @override
  Stream<FavGifsState> applyAsync(
      {FavGifsState currentState, FavGifsBloc bloc}) async* {
    GifInfo dbGif = await FavGifRepo().insert(gif);
    yield StatusFavGifsState(dbGif.innerId != null
        ? "Гифка добавлена в избранное"
        : "Гифка уже в избранном");
    yield UnFavGifsState();
    yield InFavGifsState(await FavGifRepo().getAllFavGifs());
  }
}

class RemoveFavGifsEvent extends FavGifsEvent {
  final GifInfo gif;

  RemoveFavGifsEvent(this.gif);
  @override
  Stream<FavGifsState> applyAsync(
      {FavGifsState currentState, FavGifsBloc bloc}) async* {
    await FavGifRepo().delete(gif.innerId);
    yield DeletedFavGifsState();
    yield UnFavGifsState();
    yield new InFavGifsState(await FavGifRepo().getAllFavGifs());
  }
}

class LoadFavGifsEvent extends FavGifsEvent {
  @override
  Stream<FavGifsState> applyAsync(
      {FavGifsState currentState, FavGifsBloc bloc}) async* {
    try {
      yield UnFavGifsState();
      yield new InFavGifsState(await FavGifRepo().getAllFavGifs());
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFavGifsEvent', error: _, stackTrace: stackTrace);
      yield ErrorFavGifsState(_?.toString());
    }
  }
}