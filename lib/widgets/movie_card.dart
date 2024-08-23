import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/movie_detail_widget.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text('Rating: ${movie.imdbRating}'),
        leading: CircleAvatar(
          child: Text(movie.title[0]),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 75),
            child: Column(
              children: [
                MovieDetail(movie: movie),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movie: movie,
                        ),
                      ),
                    );
                  },
                  child: const Text('Readmore'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
