import 'package:flutter/material.dart';
import 'package:inputs/pages/widgets/my_text_field.dart';

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({Key key}) : super(key: key);

  @override
  _TextFieldsPageState createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  String _email = '', _password = '';
  bool _terms = false;
  final FocusNode _focusNodePassword = FocusNode();

  void _submit() {
    print("email $_email");
    print("password $_password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFields"),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                MyTextField(
                  icon: Icons.email_outlined,
                  label: "Email",
                  hint: "email@domain.com",
                  defaultValue: "contacto@meedu.app",
                  onChanged: (String text) {
                    print("email $text");
                    _email = text;
                  },
                  onSubmitted: (_) => _focusNodePassword.requestFocus(),
                ),
                SizedBox(height: 10),
                MyTextField(
                  icon: Icons.lock_outline,
                  label: "Password",
                  focusNode: _focusNodePassword,
                  obscureText: true,
                  onChanged: (String text) {
                    _email = text;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 25,
                      child: Checkbox(
                        value: _terms,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            _terms = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _terms = !_terms;
                          });
                        },
                        child: Text("Terms & conditions Terms"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: this._submit,
                    color: Colors.blue,
                    child: Text(
                      "SEND",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
