import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/global_widgets/custom_form.dart';

class RegisterController extends ChangeNotifier {
  String _email = '', _name = '', _lastname = '';
  final AuthenticationRepository _repository = Get.i.find<AuthenticationRepository>();
  GlobalKey<CustomFormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onNameChanged(String text) {
    _name = text;
  }

  void onLastnameChanged(String text) {
    _lastname = text;
  }

  Future<bool> submit() async {
    return _repository.register(
      User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: _email,
        name: _name,
        lastname: _lastname,
        birthday: DateTime(2000, 1, 23),
      ),
    );
  }
}
