part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent {
  const SearchMoviesEvent();
}

class OnQuerySearchMovies extends SearchMoviesEvent {
  final String query;

  OnQuerySearchMovies(this.query);
}
