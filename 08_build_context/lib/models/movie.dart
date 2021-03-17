import 'package:meta/meta.dart';

class Movie {
  final int id;
  String title, description;
  List<String> comments;

  Movie({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.comments,
  });
}
