import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import './profile-events.dart';
import './profile-states.dart';
import '../repos/homeRepo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HomeDataProvider _homeRepo;
  ProfileBloc(this._homeRepo) : super(ProfileLoadingState()) {
    on<LoadProfilePage>((event, emit) async {
      final user = await _homeRepo.fetchUserImage();
      emit(ProfileLoadedState(user));
    });
    on<UploadImage>((event, emit) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDirImages.child('name');

      try {
        await referenceImageToUpload.putFile(File(pickedFile!.path));

        var imageUrl = await referenceImageToUpload.getDownloadURL();
        emit(ProfileLoadedState(imageUrl));
      } catch (error) {}
    });

    on<UpdateProfile>((event, emit) async {
      try {
        FirebaseFirestore.instance
            .collection('users')
            .doc('MeRV8I8NhowxGfa5yqfg')
            .update({
          "image_url": event.image_url,
        }).then((_) {
          print("success!");
        });
      } catch (error) {}
    });
  }
}
