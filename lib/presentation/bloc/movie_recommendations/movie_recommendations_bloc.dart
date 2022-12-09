import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_recommendations_state.dart';
part 'movie_recommendations_event.dart';

class MovieRecommendationsBloc extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  final GetMovieRecommendations getMovieRecommendations;

  MovieRecommendationsBloc({required this.getMovieRecommendations}) : super(MovieRecommendationsEmpty()) {
    on<OnFetchMovieRecommendatios>((event, emit) async {
      emit(MovieRecommendationsLoading());

      final result = await getMovieRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(MovieRecommendationsError(failure.message));
        },
        (result) {
          emit(MovieRecommendationsHasData(result));
        },
      );
    });
  }
}
