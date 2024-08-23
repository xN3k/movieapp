import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movieList = [
    // 'Deadpool and Wolverine',
    // 'Fall guy',
    // 'End Game',
  ];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/movie.json');

      final movies = MovieParser.parse(jsonString);
      _movieList = movies;
      notifyListeners();
    } catch (e) {
      print("Error message $e");
    }
  }

  // List<String> loadMovies() {
  //   return movieList;
  // }
}
