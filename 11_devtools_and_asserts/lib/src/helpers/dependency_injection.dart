import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_ux/src/data/providers/remote/food_menu_provider.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/data/repositories/food_menu_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:ui_ux/src/data/repositories_implementation/food_menu_repository_impl.dart';
import 'package:ui_ux/src/helpers/get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository authenticationRepository = AuthenticationRepositoryImpl(
      AuthenticationProvider(),
    );

    final FoodMenuRepositoryImpl foodMenuRepository = FoodMenuRepositoryImpl(
      FoodMenuProvider(),
    );

    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<String>("API_KEY", tag: "apiKey");
    Get.i.put<String>("SECRET", tag: "secret");
  }
}
