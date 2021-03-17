import 'package:build_context/models/movie.dart';
import 'package:build_context/pages/movies/movies_counter.dart';
import 'package:build_context/pages/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'movie_item.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc _bloc = MoviesBloc();

  int _counter = 100;

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesProvider(
      bloc: _bloc,
      setState: this.setState,
      counter: _counter,
      child: Scaffold(
        appBar: AppBar(
          leading: Text(_counter.toString()),
          title: MoviesCounter(),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            final Movie movie = _bloc.movies[index];
            return MovieItem(
              movie: movie,
            );
          },
          itemCount: _bloc.movies.length,
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              final bloc = MoviesProvider.of(context).bloc;
              bloc.delete();
              // MoviesProvider.of(context).setState(() {});
              _counter = bloc.movies.length;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

class MoviesBloc {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  void init() {
    final lorem = Faker().lorem;
    for (int i = 0; i < 100; i++) {
      _movies.add(Movie(
        id: i,
        title: lorem.word(),
        description: lorem.sentence(),
        comments: lorem.sentences(10),
      ));
    }
  }

  void deleteComment(int id, int commentIndex) {
    final int index = _movies.indexWhere((element) => element.id == id);
    _movies[index].comments.removeAt(commentIndex);
  }

  void delete() {
    _movies.removeLast();
  }
}
