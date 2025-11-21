import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const String keyWebViewUrl = 'webview_url';

  static Future<void> saveWebViewUrl(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyWebViewUrl, url);
  }

  static Future<String?> getWebViewUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyWebViewUrl);
  }
}
