abstract class IUkodusSharedPreferences {
  Future<int?> getInt(String key);

  Future<bool> saveInt(String key, int value);
}
