part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent {
  const PopularMoviesEvent();
}

class OnFetchPopularMovies extends PopularMoviesEvent {}
