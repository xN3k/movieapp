import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/providers/theme_provider.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/toggle_theme_button.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MovieProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: themeProvider.currentTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final movieData = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        actions: const [
          ToggleThemeButton(),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            final movie = movieData.movieList[index];
            return MovieCard(movie: movie);
            // return ListTile(
            //   title: Text(movie.title),
            //   subtitle: Text(movie.imdbRating),
            //   leading: CircleAvatar(
            //     child: Text(movie.title[0]),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
