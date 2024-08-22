import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  final List<String> _movieList = [
    'Deadpool and Wolverine',
    'Fall guy',
    'End Game',
  ];

  List<String> get movieList => _movieList;

  List<String> loadMovies() {
    return movieList;
  }
}
