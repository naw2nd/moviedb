import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:moviedb/presentation/pages/upcoming_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/movie_dummy_objects.dart';


class UpcomingMoviesEventFake extends Fake implements UpcomingMoviesEvent {}

class UpcomingMoviesStateFake extends Fake implements UpcomingMoviesState {}

class MockUpcomingMoviesBloc
    extends MockBloc<UpcomingMoviesEvent, UpcomingMoviesState>
    implements UpcomingMoviesBloc {}

void main() {
  late MockUpcomingMoviesBloc mockUpcomingMoviesBloc;

  setUpAll(() {
    registerFallbackValue(UpcomingMoviesEventFake());
    registerFallbackValue(UpcomingMoviesStateFake());
  });

  setUp(() {
    mockUpcomingMoviesBloc = MockUpcomingMoviesBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<UpcomingMoviesBloc>.value(
      value: mockUpcomingMoviesBloc,
      child: MaterialApp(
        home: Scaffold(body: body),
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockUpcomingMoviesBloc.state).thenReturn(UpcomingMoviesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const UpcomingMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockUpcomingMoviesBloc.state)
        .thenReturn(UpcomingMoviesHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const UpcomingMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockUpcomingMoviesBloc.state)
        .thenReturn(const UpcomingMoviesError('Failed'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const UpcomingMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
