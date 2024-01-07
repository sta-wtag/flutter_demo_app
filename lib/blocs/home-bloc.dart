import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_application/data/data.dart';
import './home-events.dart';
import './home-states.dart';
import '../repos/homeRepo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeDataProvider _homeRepo;
  HomeBloc(this._homeRepo) : super(HomeLoadingState()) {
    on<LoadHomePage>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final user = await _homeRepo.fetchUserImage();
        final playlist = await _homeRepo.fetchPlaylists();
        final topFive = await _homeRepo.getMyTopFiveTrack();
        final recommended = await _homeRepo.getTopFiveRecommandedSongs();
        final library = await _homeRepo.fetchLibrary();
        emit(HomeLoadedState(library, 'All'));
        emit(TabChangedState(
            'All',
            playlist.tracks?.items != null ? playlist.tracks?.items : [],
            topFive.items,
            recommended.tracks,
            library,
            user));
      } catch (error) {}
    });

    on<ChangeTabHomePage>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final user = await _homeRepo.fetchUserImage();
        final playlist = await _homeRepo.fetchPlaylists();
        final topFive = await _homeRepo.getMyTopFiveTrack();
        final recommended = await _homeRepo.getTopFiveRecommandedSongs();
        final library = await _homeRepo.fetchLibrary();
        emit(HomeLoadedState(library, event.tab));
        emit(TabChangedState(
            event.tab,
            playlist.tracks?.items != null ? playlist.tracks?.items : [],
            topFive.items,
            recommended.tracks,
            library,
            user));
      } catch (error) {}
    });
  }
}
