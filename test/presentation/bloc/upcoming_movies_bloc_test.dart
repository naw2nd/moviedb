import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:moviedb/common/failure.dart';
import 'package:moviedb/domain/entities/movie.dart';
import 'package:moviedb/domain/usecases/get_upcoming_movies.dart';
import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'upcoming_movies_bloc_test.mocks.dart';

@GenerateMocks([GetUpcomingMovies])
void main() {
  late UpcomingMoviesBloc upcomingMoviesBloc;
  late MockGetUpcomingMovies mockGetUpcomingMovies;

  setUp(() {
    mockGetUpcomingMovies = MockGetUpcomingMovies();
    upcomingMoviesBloc = UpcomingMoviesBloc(
      getUpcomingMovies: mockGetUpcomingMovies,
    );
  });

  const tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
    popularity: 1,
  );

  final tMovieList = <Movie>[tMovie];

  test('initial state should be empty', () {
    expect(upcomingMoviesBloc.state, UpcomingMoviesEmpty());
  });

  blocTest<UpcomingMoviesBloc, UpcomingMoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetUpcomingMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return upcomingMoviesBloc;
    },
    act: (bloc) => bloc.add(OnFetchUpcomingMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      UpcomingMoviesLoading(),
      UpcomingMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetUpcomingMovies.execute());
    },
  );

  blocTest<UpcomingMoviesBloc, UpcomingMoviesState>(
    'Should emit [Loading, Error] when fetch movies is unsuccessful',
    build: () {
      when(mockGetUpcomingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return upcomingMoviesBloc;
    },
    act: (bloc) => bloc.add(OnFetchUpcomingMovies()),
    expect: () => [
      UpcomingMoviesLoading(),
      const UpcomingMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetUpcomingMovies.execute());
    },
  );
}
