import 'package:dartz/dartz.dart';
import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/repositories/movie_repository.dart';
import 'package:moviedb/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
