part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesEvent  {
  const TopRatedMoviesEvent();

}

class OnFetchTopRatedMovies extends TopRatedMoviesEvent {}
