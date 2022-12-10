import 'package:dartz/dartz.dart';
import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/entities/movie_detail.dart';
import 'package:moviedb/common/failure.dart';
import 'package:moviedb/domain/entities/video.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id);
  Future<Either<Failure, List<Video>>> getMovieVideos(int id);
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
