part of 'movie_videos_bloc.dart';

abstract class MovieVideosEvent {
  const MovieVideosEvent();
}

class OnFetchMovieVideos extends MovieVideosEvent {
  final int id;

  OnFetchMovieVideos(this.id);
}
