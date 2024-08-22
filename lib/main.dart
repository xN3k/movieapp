import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/providers/theme_provider.dart';
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
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final movie = Provider.of<MovieProvider>(context).loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        actions: const [
          ToggleThemeButton(),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movie.length,
          itemBuilder: (context, index) {
            return Text(movie[index]);
          },
        ),
      ),
    );
  }
}
