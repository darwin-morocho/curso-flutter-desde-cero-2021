import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';

class LoginController extends ChangeNotifier {
  String _email = '', _password = '';
  final AuthenticationRepository _repository = Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<User> submit() async {
    return _repository.login(_email, _password);
  }
}
