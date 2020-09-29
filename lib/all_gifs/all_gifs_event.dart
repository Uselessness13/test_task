import 'package:meta/meta.dart';

@immutable
abstract class AllGifsEvent {}

class LoadAllGifsEvent extends AllGifsEvent {}

class ClearGifsEvent extends AllGifsEvent {}
