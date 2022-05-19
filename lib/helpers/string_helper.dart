class StringHelper {
  static String upperCaseFirst(String? s) {
    return (s ?? '').isEmpty ? '' : s![0].toUpperCase() + s.substring(1);
  }
}
