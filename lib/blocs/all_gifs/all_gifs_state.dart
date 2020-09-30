part of 'all_gifs_bloc.dart';

abstract class AllGifsState extends Equatable {
  final List propss;
  AllGifsState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnAllGifsState extends AllGifsState {
  UnAllGifsState();

  @override
  String toString() => 'UnAllGifsState';
}

/// Initialized
enum GifStatus { initial, success, failure }

class InAllGifsState extends Equatable {
  const InAllGifsState({
    this.status = GifStatus.initial,
    this.gifs = const <GifInfo>[],
    this.hasReachedMax = false,
  });

  final GifStatus status;
  final List<GifInfo> gifs;
  final bool hasReachedMax;

  InAllGifsState copyWith({
    GifStatus status,
    List<GifInfo> gifs,
    bool hasReachedMax,
  }) {
    return InAllGifsState(
      status: status ?? this.status,
      gifs: gifs ?? this.gifs,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, gifs, hasReachedMax];
}

class ErrorAllGifsState extends AllGifsState {
  final String errorMessage;

  ErrorAllGifsState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAllGifsState';
}
