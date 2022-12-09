import 'package:moviedb/common/constants.dart';
import 'package:moviedb/presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:moviedb/presentation/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/presentation/widgets/movie_poster_card.dart';

class MovieDashboardPage extends StatefulWidget {
  const MovieDashboardPage({super.key});

  @override
  State<MovieDashboardPage> createState() => _MovieDashboardPageState();
}

class _MovieDashboardPageState extends State<MovieDashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMoviesBloc>().add(OnFetchNowPlayingMovies());
      context.read<PopularMoviesBloc>().add(OnFetchPopularMovies());
      context.read<UpcomingMoviesBloc>().add(OnFetchUpcomingMovies());
      context.read<TopRatedMoviesBloc>().add(OnFetchTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Now Playing',
            style: cHeading6,
          ),
          BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
              builder: (context, state) {
            if (state is NowPlayingMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingMoviesHasData) {
              return MoviePosterCard(state.result);
            } else {
              return const Text('Failed');
            }
          }),
          Text(
            'Upcoming',
            style: cHeading6,
          ),
          BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
              builder: (context, state) {
            if (state is UpcomingMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UpcomingMoviesHasData) {
              return MoviePosterCard(state.result);
            } else {
              return const Text('Failed');
            }
          }),
          Text(
            'Popular',
            style: cHeading6,
          ),
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
            if (state is PopularMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularMoviesHasData) {
              return MoviePosterCard(state.result);
            } else {
              return const Text('Failed');
            }
          }),
          Text(
            'Top Rated',
            style: cHeading6,
          ),
          BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
              builder: (context, state) {
            if (state is TopRatedMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedMoviesHasData) {
              return MoviePosterCard(state.result);
            } else {
              return const Text('Failed');
            }
          }),
        ],
      ),
    );
  }
}
