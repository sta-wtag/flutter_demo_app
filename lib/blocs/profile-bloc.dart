import 'package:flutter_bloc/flutter_bloc.dart';
import './profile-events.dart';
import './profile-states.dart';
import '../repos/homeRepo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HomeDataProvider _homeRepo;
  ProfileBloc(this._homeRepo) : super(ProfileLoadingState()) {
    on<LoadProfilePage>((event, emit) async {
      emit(ProfileLoadedState());
    });
    on<UploadImage>((event, emit) async {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage();
      if (pickedFiles.length > 0) {
        pickedFiles.forEach((file) {
          // state.images.add(File(file.path));
        });
      }
      try {
        emit(ImageUploadedState());
      } catch (error) {}
    });
  }
}
