import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static Future<void> launch(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
