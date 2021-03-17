import 'package:build_context/models/movie.dart';
import 'package:flutter/material.dart';

import 'movies_provider.dart';

class Comments extends StatelessWidget {
  const Comments({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Text(movie.comments[index]),
            onLongPress: () {
              MoviesProvider.of(context).bloc.deleteComment(movie.id, index);
              MoviesProvider.of(context).setState(() {});
            },
          ),
        );
      },
      itemCount: movie.comments.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
