part of 'movie_videos_bloc.dart';


abstract class MovieVideosState extends Equatable {
  const MovieVideosState();
  @override
  List<Object> get props => [];
}

class MovieVideosEmpty extends MovieVideosState {}

class MovieVideosLoading extends MovieVideosState {}

class MovieVideosError extends MovieVideosState {
  final String message;

  const MovieVideosError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieVideosHasData extends MovieVideosState {
  final List<Video> result;

  const MovieVideosHasData(this.result);

  @override
  List<Object> get props => [result];
}