import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/common/constants.dart';
import 'package:moviedb/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:moviedb/presentation/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _selectedSearch = 'Movies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                context
                    .read<SearchMoviesBloc>()
                    .add(OnQuerySearchMovies(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_selectedSearch Result',
                  style: kHeading6.copyWith(color: kMikadoYellow),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedSearch = 'Movies';
                          });
                        },
                        icon: Icon(
                          Icons.movie,
                          color: _selectedSearch == 'Movies'
                              ? kMikadoYellow
                              : Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedSearch = 'Tv Shows';
                          });
                        },
                        icon: Icon(
                          Icons.tv,
                          color: _selectedSearch == 'Tv Shows'
                              ? kMikadoYellow
                              : Colors.white,
                        )),
                  ],
                ),
              ],
            ),
            const MovieSearchResult(),
          ],
        ),
      ),
    );
  }
}

class MovieSearchResult extends StatelessWidget {
  const MovieSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SearchMoviesHasData) {
          final result = state.result;
          if (result.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('Movies Not Found'),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final movie = state.result[index];
                return MovieCard(movie);
              },
              itemCount: result.length,
            ),
          );
        } else {
          return Expanded(
            child: Container(),
          );
        }
      },
    );
  }
}
