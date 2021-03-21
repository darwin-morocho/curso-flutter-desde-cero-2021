abstract class PreferencesRepository {
  Future<void> setOnboardAndWelcomeReady(bool ready);
  bool get onboardAndWelcomeReady;
}
