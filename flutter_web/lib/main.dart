import 'package:flutter/material.dart';
import 'package:ui_ux/src/helpers/dependency_injection.dart';

import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();
  runApp(MyApp());
}
