import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  DateTime _birthday;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isOk = _formKey.currentState.validate();
    print("🎃 $isOk");
    if (isOk) {
      print("🎃 $_email");
      print("🎃 $_password");
      print("🎃 $_birthday");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    onChanged: (text) => _email = text,
                    validator: (text) {
                      if (text.contains("@")) return null;
                      return "Invalid email";
                    },
                  ),
                  SizedBox(height: 10),
                  BirthdayFormField(
                    onChanged: (value) {
                      _birthday = value;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    onChanged: (text) => _password = text,
                    validator: (text) {
                      if (text.trim().length > 5) {
                        return null;
                      }
                      return "Invalid password";
                    },
                  ),
                  FlatButton(
                    onPressed: _submit,
                    child: Text("SEND"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BirthdayFormField extends StatelessWidget {
  const BirthdayFormField({
    Key key,
    DateTime initialValue,
    this.onChanged,
  })  : _birthday = initialValue,
        super(key: key);

  final DateTime _birthday;
  final void Function(DateTime value) onChanged;

  void _pickBirthday(BuildContext context, FormFieldState<DateTime> state) async {
    final birthday = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (birthday != null) {
      state.didChange(birthday);
      if (onChanged != null) onChanged(birthday);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: () => _pickBirthday(context, state),
            child: Text(
              _birthday == null ? "Pick your birthday" : _birthday.toString(),
            ),
          ),
          if (state.hasError)
            Text(
              state.errorText,
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
        ],
      ),
      validator: (date) {
        if (date == null) return "Select a valid date";
        return null;
      },
    );
  }
}
