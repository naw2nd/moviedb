import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviedb/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/movie_dummy_objects.dart';

void main() {
  Widget makeTestableWidget(Widget body) => MaterialApp(
        home: Scaffold(body: body),
      );
  testWidgets('Card should display movie datail when data is loaded',
      (WidgetTester tester) async {
    final finderTitle = find.text('Spider-Man');
    final finderOverview = find.text(
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    );
    final finderImage = find.byType(CachedNetworkImage);

    await tester.pumpWidget(makeTestableWidget(const MovieCard(testMovie)));

    expect(finderTitle, findsOneWidget);
    expect(finderOverview, findsOneWidget);
    expect(finderImage, findsOneWidget);
  });
}
