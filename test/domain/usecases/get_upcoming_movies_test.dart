import 'package:dartz/dartz.dart';
import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/usecases/get_upcoming_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetUpcomingMovies usecase;
  late MockMovieRepository mockMovieRpository;

  setUp(() {
    mockMovieRpository = MockMovieRepository();
    usecase = GetUpcomingMovies(mockMovieRpository);
  });

  final tMovies = <Movie>[];

  group('GetUpcomingMovies Tests', () {
    group('execute', () {
      test(
          'should get list of movies from the repository when execute function is called',
          () async {
        // arrange
        when(mockMovieRpository.getUpcomingMovies())
            .thenAnswer((_) async => Right(tMovies));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tMovies));
      });
    });
  });
}
