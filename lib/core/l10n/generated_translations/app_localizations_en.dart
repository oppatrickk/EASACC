// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login_google => 'Login with Google';

  @override
  String get login_facebook => 'Login with Facebook';

  @override
  String get login_description => 'TASK DEMO APPLICATION';

  @override
  String get webview => 'WebView';

  @override
  String get webview_recent => 'Recent';

  @override
  String get webview_no_recent => 'No Recent URLs Yet!';

  @override
  String get webview_first_url_title =>
      'Set your first URL in the Edit Icon in the App bar';

  @override
  String get webview_first_url_description =>
      'You can also change this in the settings!';

  @override
  String get webview_cancel => 'Cancel';

  @override
  String get webview_save => 'Save';

  @override
  String get webview_invalid_url => 'Invalid URL. Try again!';

  @override
  String get settings => 'Settings';

  @override
  String get settings_general => 'GENERAL';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_theme_mode => 'Theme Mode';

  @override
  String get settings_light => 'Light';

  @override
  String get settings_dark => 'Dark';

  @override
  String get settings_webview => 'WEBVIEW';

  @override
  String get settings_webview_configure => 'Configure URL';

  @override
  String get settings_network_devices => 'Network Devices';

  @override
  String get settings_configure => 'Configure Connected Devices';

  @override
  String get settings_logout => 'Logout';
}
