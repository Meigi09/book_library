import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _keySortOrder = 'sortOrder';
  static const String _keyThemeMode = 'themeMode';

  static Future<void> setSortOrder(String sortOrder) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySortOrder, sortOrder);
  }

  static Future<String?> getSortOrder() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySortOrder);
  }

  static Future<void> setThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, themeMode);
  }

  static Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyThemeMode);
  }
}
