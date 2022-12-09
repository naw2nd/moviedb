part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsEvent {
  const MovieRecommendationsEvent();
}

class OnFetchMovieRecommendatios extends MovieRecommendationsEvent {
  final int id;

  OnFetchMovieRecommendatios(this.id);
}
