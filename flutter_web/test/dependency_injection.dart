import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';
import 'package:ui_ux/src/data/providers/local/prefrences_provider.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';
import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_ux/src/data/repositories/account_repository.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/data/repositories/food_menu_repository.dart';
import 'package:ui_ux/src/data/repositories/preferences_repository.dart';
import 'package:ui_ux/src/data/repositories/websocket_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/account_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/food_menu_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/preferences_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/websocket_repository_impl.dart';
import 'package:ui_ux/src/helpers/get.dart';

import 'mock/mock_account_provider.dart';
import 'mock/mock_authentication_client.dart';
import 'mock/mock_authentication_provider.dart';
import 'mock/mock_food_menu_provider.dart';
import 'mock/mock_websocket_provider.dart';

abstract class TestDependencyInjection {
  static Future<void> initialize() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final PreferencesProvider preferencesProvider = PreferencesProvider(preferences);

    Get.i.put<PreferencesRepository>(
      PreferencesRepositoryImpl(preferencesProvider),
    );
    final authenticationProvider = MockAuthenticationProvider();
    final authenticationClient = MockAuthenticationClient(preferences);
    Get.i.put<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationProvider, authenticationClient),
    );

    final accountProvider = MockAccountProvider(authenticationClient);
    Get.i.put<AccountRepository>(AccountRepositoryImpl(accountProvider));

    Get.i.put<WebsocketRepository>(
      WebsocketRepositoryImpl(MockWebsocketProvider()),
    );
    Get.i.put<FoodMenuRepository>(
      FoodMenuRepositoryImpl(MockFoodMenuProvider()),
    );
  }

  static clear() {
    Get.i.clear();
    Get.i.lazyClear();
  }
}
