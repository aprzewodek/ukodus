import 'package:ukodus/plugins/interfaces/iukodus_shared_preferences.dart';
import 'package:ukodus/plugins/interfaces/iukodus_url_launcher.dart';
import 'package:ukodus/plugins/plugins/ukodus_shared_preferences.dart';
import 'package:ukodus/plugins/plugins/ukodus_url_launcher.dart';

class IoC {
  static final IoC _instance = IoC._internal();

  factory IoC() {
    return _instance;
  }

  IoC._internal() {
    // initialization logic
  }

  IUkodusUrlLauncher get urlLauncher {
    return UkodusUrlLauncher();
  }

  IUkodusSharedPreferences get sharedPreferences {
    return UkodusSharedPreferences();
  }
}
