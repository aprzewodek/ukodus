import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukodus/plugins/interfaces/iukodus_shared_preferences.dart';

class UkodusSharedPreferences implements IUkodusSharedPreferences {
  static final UkodusSharedPreferences _instance =
      UkodusSharedPreferences._internal();

  factory UkodusSharedPreferences() {
    return _instance;
  }

  UkodusSharedPreferences._internal() {
    // initialization logic
  }

  @override
  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt(key);
    return value;
  }

  @override
  Future<bool> saveInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }
}
