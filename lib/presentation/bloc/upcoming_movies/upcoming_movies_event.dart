part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesEvent {
  const UpcomingMoviesEvent();
}

class OnFetchUpcomingMovies extends UpcomingMoviesEvent {}
