class User {
  final String id, email, name, lastname;
  final DateTime birthday;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.lastname,
    required this.birthday,
  }) : assert(email.contains("@"), "Invalid email");
}
