abstract class PreferenceService {
  Future<void> initializePreferences();

  // set values
  Future<void> setString(String key, String value);

  // get values
  Future<String?> getString(String key);

  // remove
  Future<void> remove(String key);

  //has key
  bool containsKey(String key);
}
