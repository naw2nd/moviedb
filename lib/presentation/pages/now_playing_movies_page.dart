import 'package:moviedb/presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:moviedb/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMoviesPage extends StatefulWidget {
  static const routeName = '/now-playing-movies';

  const NowPlayingMoviesPage({super.key});

  @override
  NowPlayingMoviesPageState createState() => NowPlayingMoviesPageState();
}

class NowPlayingMoviesPageState extends State<NowPlayingMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
        builder: (context, state) {
          if (state is NowPlayingMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NowPlayingMoviesHasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.result[index];
                return MovieCard(movie);
              },
              itemCount: state.result.length,
            );
          } else {
            return const Center(
              key: Key('error_message'),
              child: Text('Failed'),
            );
          }
        },
      ),
    );
  }
}
