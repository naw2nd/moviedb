part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();
  @override
  List<Object> get props => [];
}

class UpcomingMoviesEmpty extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesError extends UpcomingMoviesState {
  final String message;

  const UpcomingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class UpcomingMoviesHasData extends UpcomingMoviesState {
  final List<Movie> result;

  const UpcomingMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
