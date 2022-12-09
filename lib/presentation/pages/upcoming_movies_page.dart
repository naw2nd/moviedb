import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:moviedb/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMoviesPage extends StatefulWidget {
  static const routeName = '/upcoming-movie';

  const UpcomingMoviesPage({super.key});

  @override
  UpcomingMoviesPageState createState() => UpcomingMoviesPageState();
}

class UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<UpcomingMoviesBloc>().add(OnFetchUpcomingMovies()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UpcomingMoviesHasData) {
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
