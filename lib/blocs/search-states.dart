import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../data/data.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SeachPageLoadedState extends SearchState {
  SeachPageLoadedState(this.genres);

  List<String>? genres;
  @override
  List<Object?> get props => [genres];
}
