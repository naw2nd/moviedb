import 'package:moviedb/presentation/pages/about_page.dart';
import 'package:moviedb/presentation/pages/movie_dashboard_page.dart';
import 'package:moviedb/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(child: MovieDashboardPage()),
      ),
    );
  }
}
