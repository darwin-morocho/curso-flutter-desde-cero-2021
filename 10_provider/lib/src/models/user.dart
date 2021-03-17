import 'package:meta/meta.dart' show required;

class User {
  final int id;
  final String email, name;
  final DateTime birthday;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.birthday,
  });
}
