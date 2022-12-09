import 'package:dartz/dartz.dart';
import 'package:moviedb/domain/entities/movie_detail.dart';
import 'package:moviedb/domain/repositories/movie_repository.dart';
import 'package:moviedb/common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
