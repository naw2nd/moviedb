import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:moviedb/data/datasources/movie_remote_data_source.dart';
import 'package:moviedb/data/repositories/movie_repository_impl.dart';
import 'package:moviedb/domain/repositories/movie_repository.dart';
import 'package:moviedb/domain/usecases/get_movie_detail.dart';
import 'package:moviedb/domain/usecases/get_movie_videos.dart';
import 'package:moviedb/domain/usecases/get_now_playing_movies.dart';
import 'package:moviedb/domain/usecases/get_popular_movies.dart';
import 'package:moviedb/domain/usecases/get_top_rated_movies.dart';
import 'package:moviedb/domain/usecases/get_upcoming_movies.dart';
import 'package:moviedb/domain/usecases/search_movies.dart';
import 'package:moviedb/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:moviedb/presentation/bloc/movie_videos/movie_videos_bloc.dart';
import 'package:moviedb/presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieVideosBloc(
      getMovieVideos: locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMoviesBloc(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesBloc(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesBloc(
      getNowPlayingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => UpcomingMoviesBloc(
      getUpcomingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      getTopRatedMovies: locator(),
    ),
  );
  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetUpcomingMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieVideos(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));

  // helper

  // external
  locator.registerLazySingleton(() => http.Client());
}
