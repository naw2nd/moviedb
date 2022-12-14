import 'package:moviedb/common/constants.dart';
import 'package:moviedb/common/utils.dart';
import 'package:moviedb/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:moviedb/presentation/bloc/movie_videos/movie_videos_bloc.dart';
import 'package:moviedb/presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:moviedb/presentation/pages/about_page.dart';
import 'package:moviedb/presentation/pages/home_page.dart';
import 'package:moviedb/presentation/pages/movie_detail_page.dart';
import 'package:moviedb/presentation/pages/now_playing_movies_page.dart';
import 'package:moviedb/presentation/pages/popular_movies_page.dart';
import 'package:moviedb/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/injection.dart' as di;
import 'package:moviedb/presentation/pages/top_rated_movies_page.dart';
import 'package:moviedb/presentation/pages/upcoming_movies_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieVideosBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<UpcomingMoviesBloc>(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/home',
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: cColorScheme,
          primaryColor: cRichBlack,
          scaffoldBackgroundColor: cRichBlack,
          textTheme: cTextTheme,
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomePage());
            case PopularMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case NowPlayingMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const NowPlayingMoviesPage());
            case UpcomingMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const UpcomingMoviesPage());
            case TopRatedMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.routeName:
              return MaterialPageRoute(builder: (_) => const SearchPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
