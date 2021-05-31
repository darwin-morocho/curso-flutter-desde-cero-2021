import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';
import 'package:ui_ux/src/data/providers/local/prefrences_provider.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';
import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_ux/src/data/providers/remote/food_menu_provider.dart';
import 'package:ui_ux/src/data/providers/remote/websocket_provider.dart';
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

typedef VoidCallback = void Function();

abstract class DependencyInjection {
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final preferencesProvider = PreferencesProvider(prefs);
    final authenticationClient = AuthenticationClient(prefs);

    final authenticationRepository = AuthenticationRepositoryImpl(
      AuthenticationProvider(),
      AuthenticationClient(prefs),
    );

    final foodMenuRepository = FoodMenuRepositoryImpl(
      FoodMenuProvider(),
    );

    final preferencesRepository = PreferencesRepositoryImpl(preferencesProvider);

    final accountRepository = AccountRepositoryImpl(
      AccountProvider(authenticationClient),
    );

    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<String>("API_KEY", tag: "apiKey");
    Get.i.put<String>("SECRET", tag: "secret");
    Get.i.put<PreferencesRepository>(preferencesRepository);
    Get.i.put<AccountRepository>(accountRepository);
    Get.i.lazyPut<WebsocketRepository>(() {
      final wsProvider = WebsocketProvider();
      final websocketRepository = WebsocketRepositoryImpl(
        wsProvider,
      );
      return websocketRepository;
    });
    Get.i.put<bool>(false, tag: 'after-splash');

    final VoidCallback dispose = () {
      // wsProvider.dispose();
    };

    Get.i.put<VoidCallback>(dispose, tag: 'dispose');
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: 'dispose');
    dispose();
  }
}
