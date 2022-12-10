import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/usecases/search_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_movies_state.dart';
part 'search_movies_event.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;

  SearchMoviesBloc({required this.searchMovies}) : super(SearchMoviesEmpty()) {
    on<OnInitSearchMovies>((event, emit) async {
      emit(SearchMoviesEmpty());
    });
    
    on<OnQuerySearchMovies>((event, emit) async {
      emit(SearchMoviesLoading());

      final result = await searchMovies.execute(event.query);

      result.fold(
        (failure) {
          emit(SearchMoviesError(failure.message));
        },
        (result) {
          emit(SearchMoviesHasData(result));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
