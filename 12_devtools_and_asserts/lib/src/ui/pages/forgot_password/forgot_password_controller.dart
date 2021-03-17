import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';

class ForgotPasswordController extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  final AuthenticationRepository _repository = Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<bool> submit() {
    return _repository.sendResetToken(_email);
  }
}
