import 'package:moviedb/presentation/pages/about_page.dart';
import 'package:moviedb/presentation/pages/movie_dashboard_page.dart';
import 'package:moviedb/presentation/pages/now_playing_movies_page.dart';
import 'package:moviedb/presentation/pages/popular_movies_page.dart';
import 'package:moviedb/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/presentation/pages/top_rated_movies_page.dart';
import 'package:moviedb/presentation/pages/upcoming_movies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String childRoute = 'dashboard';
  String childTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          key: const Key('home_page_drawer'),
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo_movies.jpg'),
                ),
                accountName: Text('Nawa Almahasin'),
                accountEmail: Text('dragneel77@gmail.com'),
              ),
              ListTile(
                key: const Key('home_list_tile_drawer'),
                onTap: () {
                  setState(() {
                    childRoute = '/dashboard';
                    childTitle = 'Home';
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                key: const Key('now_playing_list_tile_drawer'),
                onTap: () {
                  setState(() {
                    childRoute = NowPlayingMoviesPage.routeName;
                    childTitle = 'Now Playing Movies';
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.play_circle_outline),
                title: const Text('Now Playing Movies'),
              ),
              ListTile(
                key: const Key('upcoming_list_tile_drawer'),
                onTap: () {
                  setState(() {
                    childRoute = UpcomingMoviesPage.routeName;
                    childTitle = 'Upcoming Movies';
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.movie_outlined),
                title: const Text('Upcoming Movies'),
              ),
              ListTile(
                key: const Key('popular_list_tile_drawer'),
                onTap: () {
                  setState(() {
                    childRoute = PopularMoviesPage.routeName;
                    childTitle = 'Popular Movies';
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.show_chart),
                title: const Text('Popular Movies'),
              ),
              ListTile(
                key: const Key('top_rated_list_tile_drawer'),
                onTap: () {
                  setState(() {
                    childRoute = TopRatedMoviesPage.routeName;
                    childTitle = 'Top Rated Movies';
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.star_rounded),
                title: const Text('Top Rated Movies'),
              ),
              ListTile(
                key: const Key('about_list_tile_drawer'),
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.routeName);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(childTitle),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.routeName);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            switch (childRoute) {
              case NowPlayingMoviesPage.routeName:
                return const NowPlayingMoviesPage();
              case UpcomingMoviesPage.routeName:
                return const UpcomingMoviesPage();
              case PopularMoviesPage.routeName:
                return const PopularMoviesPage();
              case TopRatedMoviesPage.routeName:
                return const TopRatedMoviesPage();
              default:
                return const MovieDashboardPage();
            }
          }),
        ));
  }
}
