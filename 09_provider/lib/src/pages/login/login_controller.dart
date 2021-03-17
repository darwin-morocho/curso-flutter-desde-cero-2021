import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider_example/src/models/user.dart';

class LoginController extends ChangeNotifier {
  String _email = '', _password = '';
  final _formKey = GlobalKey<FormState>();

  Timer _timer;

  String get email => _email;
  String get password => _password;
  GlobalKey<FormState> get formKey => _formKey;

  LoginController() {
    this.initState();
  }

  void onEmailChanged(String text) {
    _email = text;
    notifyListeners();
  }

  void onPasswordChanged(String text) {
    _password = text;
    notifyListeners();
  }

  User submit() {
    if (email == "test@test.com" && password == "123456") {
      return User(
        id: 10200,
        email: "test@test.com",
        name: "Test",
        birthday: DateTime(1990, 12, 1),
      );
    }
    return null;
  }

  void initState() {
    print("initState");
  }

  void afterFirstLayout() {
    print("afterFirstLayout");
  }

  @override
  void dispose() {
    print("dispose loginController");
    _timer?.cancel();
    super.dispose();
  }
}
