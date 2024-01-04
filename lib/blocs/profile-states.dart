import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../data/data.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileLoadedState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ImageUploadedState extends ProfileState {
  ImageUploadedState();

  @override
  List<Object?> get props => [];
}
