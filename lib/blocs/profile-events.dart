import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

class LoadProfilePage extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UploadImage extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
