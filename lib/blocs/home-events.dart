import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class LoadHomePage extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeTabHomePage extends HomeEvent {
  ChangeTabHomePage(this.tab);
  final String tab;
  @override
  List<Object?> get props => [tab];
}
