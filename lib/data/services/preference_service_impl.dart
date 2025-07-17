import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsy/domain/services/preference_service.dart';

class PreferenceServiceImpl implements PreferenceService {
  late final SharedPreferences prefs;

  @override
  Future<void> initializePreferences() async {
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {}
  }

  @override
  bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  @override
  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }
}
