import 'package:moviedb/presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:moviedb/presentation/pages/now_playing_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/movie_dummy_objects.dart';

class NowPlayingMoviesEventFake extends Fake implements NowPlayingMoviesEvent {}

class NowPlayingMoviesStateFake extends Fake implements NowPlayingMoviesState {}

class MockNowPlayingMoviesBloc
    extends MockBloc<NowPlayingMoviesEvent, NowPlayingMoviesState>
    implements NowPlayingMoviesBloc {}

void main() {
  late MockNowPlayingMoviesBloc mockNowPlayingMoviesBloc;

  setUpAll(() {
    registerFallbackValue(NowPlayingMoviesEventFake());
    registerFallbackValue(NowPlayingMoviesStateFake());
  });

  setUp(() {
    mockNowPlayingMoviesBloc = MockNowPlayingMoviesBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<NowPlayingMoviesBloc>.value(
      value: mockNowPlayingMoviesBloc,
      child: MaterialApp(
        home: Scaffold(body: body),
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockNowPlayingMoviesBloc.state)
        .thenReturn(NowPlayingMoviesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockNowPlayingMoviesBloc.state)
        .thenReturn(NowPlayingMoviesHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockNowPlayingMoviesBloc.state)
        .thenReturn(const NowPlayingMoviesError('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
