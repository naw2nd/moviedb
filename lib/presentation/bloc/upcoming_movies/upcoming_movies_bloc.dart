import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/usecases/get_upcoming_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_movies_state.dart';
part 'upcoming_movies_event.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMovies getUpcomingMovies;

  UpcomingMoviesBloc({required this.getUpcomingMovies}) : super(UpcomingMoviesEmpty()) {
    on<OnFetchUpcomingMovies>((event, emit) async {
      emit(UpcomingMoviesLoading());

      final result = await getUpcomingMovies.execute();

      result.fold(
        (failure) {
          emit(UpcomingMoviesError(failure.message));
        },
        (result) {
          emit(UpcomingMoviesHasData(result));
        },
      );
    });
  }
}
