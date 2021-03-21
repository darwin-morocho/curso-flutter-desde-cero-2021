import 'package:ui_ux/src/data/providers/local/prefrences_provider.dart';
import 'package:ui_ux/src/data/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final PreferencesProvider _provider;
  PreferencesRepositoryImpl(this._provider);

  @override
  bool get onboardAndWelcomeReady => _provider.onboardAndWelcomeReady;

  @override
  Future<void> setOnboardAndWelcomeReady(bool ready) {
    return _provider.setOnboardAndWelcomeReady(ready);
  }
}
