import 'package:meta/meta.dart' show required;

class User {
  final String id, email, name, lastname;
  final DateTime birthday;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.lastname,
    @required this.birthday,
  })  : assert(id != null, "id can't be null"),
        assert(email != null && email.contains("@"), "Invalid email"),
        assert(name != null),
        assert(lastname != null),
        assert(birthday != null);
}
