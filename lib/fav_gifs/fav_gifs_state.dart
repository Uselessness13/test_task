import 'package:Test_task/data/models/gif_info.dart';
import 'package:equatable/equatable.dart';

abstract class FavGifsState extends Equatable {
  final List propss;
  FavGifsState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnFavGifsState extends FavGifsState {
  UnFavGifsState();

  @override
  String toString() => 'UnFavGifsState';
}

/// Initialized
class InFavGifsState extends FavGifsState {
  final List<GifInfo> gifs;

  InFavGifsState(this.gifs) : super([gifs]);

  @override
  String toString() => 'InFavGifsState';
}

class StatusFavGifsState extends FavGifsState {
  final String status;

  StatusFavGifsState(this.status) : super([status]);

  @override
  String toString() => 'StatusFavGifsState';
}

class DeletedFavGifsState extends FavGifsState {
  DeletedFavGifsState();

  @override
  String toString() => 'StatusFavGifsState';
}

class ErrorFavGifsState extends FavGifsState {
  final String errorMessage;

  ErrorFavGifsState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorFavGifsState';
}
