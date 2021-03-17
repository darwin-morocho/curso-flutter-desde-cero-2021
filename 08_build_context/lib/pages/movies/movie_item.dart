import 'package:build_context/models/movie.dart';
import 'package:flutter/material.dart';

import 'comments.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(movie.title),
            Container(
              height: 150,
              color: Colors.black12,
            ),
            Text(movie.description),
            SizedBox(height: 20),
            Comments(
              movie: movie,
            )
          ],
        ),
      ),
    );
  }
}
