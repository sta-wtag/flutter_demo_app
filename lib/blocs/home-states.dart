import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../data/data.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState(this.myLibraries, this.tab);

  List? myLibraries;
  String tab;

  @override
  List<Object?> get props => [myLibraries, tab];
}

class TabChangedState extends HomeState {
  TabChangedState(this.tab, this.playlists, this.topFive, this.recommended,
      this.myLibraries, this.user);
  List<String> myLibraries;
  List? recommended;
  List? playlists;
  List? topFive;
  String tab;
  dynamic user;
  @override
  List<Object?> get props =>
      [tab, playlists, topFive, recommended, myLibraries, user];
}
