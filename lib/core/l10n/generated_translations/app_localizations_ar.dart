// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login_google => 'تسجيل الدخول عبر Google';

  @override
  String get login_facebook => 'تسجيل الدخول عبر Facebook';

  @override
  String get login_description => 'تطبيق تجريبي';

  @override
  String get webview => 'عرض ويب';

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
  String get settings => 'الإعدادات';

  @override
  String get settings_general => 'عام';

  @override
  String get settings_language => 'اللغة';

  @override
  String get settings_theme_mode => 'وضع السمة';

  @override
  String get settings_light => 'فاتح';

  @override
  String get settings_dark => 'داكن';

  @override
  String get settings_webview => 'عرض ويب';

  @override
  String get settings_webview_configure => 'تكوين الرابط';

  @override
  String get settings_network_devices => 'الأجهزة المتصلة بالشبكة';

  @override
  String get settings_configure => 'تكوين الأجهزة المتصلة';

  @override
  String get settings_logout => 'تسجيل الخروج';
}
