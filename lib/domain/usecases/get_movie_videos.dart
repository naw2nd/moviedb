import 'package:dartz/dartz.dart';
import 'package:moviedb/domain/entities/video.dart';
import 'package:moviedb/domain/repositories/movie_repository.dart';
import 'package:moviedb/common/failure.dart';

class GetMovieVideos {
  final MovieRepository repository;

  GetMovieVideos(this.repository);

  Future<Either<Failure, List<Video>>> execute(int id) {
    return repository.getMovieVideos(id);
  }
}
