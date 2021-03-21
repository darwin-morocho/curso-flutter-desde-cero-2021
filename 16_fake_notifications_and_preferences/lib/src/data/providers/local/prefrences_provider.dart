import 'package:shared_preferences/shared_preferences.dart';

const _key = "OnboardAndWelcome";

class PreferencesProvider {
  SharedPreferences _preferences;
  PreferencesProvider(this._preferences);

  Future<void> setOnboardAndWelcomeReady(bool ready) async {
    await _preferences.setBool(_key, ready);
  }

  bool get onboardAndWelcomeReady {
    return _preferences.getBool(_key) ?? false;
  }
}
