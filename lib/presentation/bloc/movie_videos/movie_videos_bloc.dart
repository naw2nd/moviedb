import 'package:moviedb/domain/entities/video.dart';
import 'package:moviedb/domain/usecases/get_movie_videos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_videos_state.dart';
part 'movie_videos_event.dart';

class MovieVideosBloc extends Bloc<MovieVideosEvent, MovieVideosState> {
  final GetMovieVideos getMovieVideos;
  
  MovieVideosBloc({required this.getMovieVideos}) : super(MovieVideosEmpty()) {
    on<OnFetchMovieVideos>((event, emit) async {
      emit(MovieVideosLoading());

      final result = await getMovieVideos.execute(event.id);

      result.fold(
        (failure) {
          emit(MovieVideosError(failure.message));
        },
        (result) {
          emit(MovieVideosHasData(result));
        },
      );
    });
  }
}
