import 'package:flutter_bloc/flutter_bloc.dart';
import './search-events.dart';
import './search-states.dart';
import '../repos/homeRepo.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final HomeDataProvider _homeRepo;
  SearchBloc(this._homeRepo) : super(SearchLoadingState()) {
    on<LoadSearchPage>((event, emit) async {
      emit(SearchLoadingState());

      try {
        final user = await _homeRepo.fetchUserImage();
        final genres = await _homeRepo.fetchGenres();
        emit(SeachPageLoadedState(genres.genres, user));
      } catch (error) {
        print(error);
      }
    });
  }
}
