import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';
import 'package:ui_ux/src/data/providers/local/prefrences_provider.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';
import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_ux/src/data/repositories/account_repository.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/data/repositories/preferences_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/account_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/preferences_repository_impl.dart';
import 'package:ui_ux/src/helpers/get.dart';

import 'authentication_test.dart';

abstract class TestDependencyInjection {
  static Future<void> initialize() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final PreferencesProvider preferencesProvider = PreferencesProvider(preferences);

    Get.i.put<PreferencesRepository>(
      PreferencesRepositoryImpl(preferencesProvider),
    );

    // final authenticationProvider = AuthenticationProvider();
    // final authenticationClient = AuthenticationClient(preferences);

    final authenticationProvider = MockAuthenticationProvider();
    final authenticationClient = MockAuthenticationClient();

    Get.i.put<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationProvider, authenticationClient),
    );
    // final accountProvider = AccountProvider(authenticationClient);
    final accountProvider = MockAccountProvider();
    Get.i.put<AccountRepository>(AccountRepositoryImpl(accountProvider));
  }

  static clear() {
    Get.i.clear();
    Get.i.lazyClear();
  }
}
