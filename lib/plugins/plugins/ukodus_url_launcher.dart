import 'package:ukodus/helpers/logger.dart';
import 'package:ukodus/plugins/interfaces/iukodus_url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class UkodusUrlLauncher implements IUkodusUrlLauncher {
  static final UkodusUrlLauncher _instance = UkodusUrlLauncher._internal();

  factory UkodusUrlLauncher() {
    return _instance;
  }

  UkodusUrlLauncher._internal() {
    // initialization logic
  }

  @override
  Future<bool> goToEmailApp(String address) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'a_przewodek@o2.pl',
    );

    try {
      await launchUrl(emailLaunchUri);
      return true;
    } catch (ex, stackTrace) {
      Logger().log(exception: ex, stackTrace: stackTrace);
      return false;
    }
  }

  @override
  Future<bool> goToWebSite(String address) async {
    final Uri url = Uri.parse(address);

    try {
      await launchUrl(url);
      return true;
    } catch (ex, stackTrace) {
      Logger().log(exception: ex, stackTrace: stackTrace);
      return false;
    }
  }
}
