// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login_google => 'تسجيل الدخول باستخدام Google';

  @override
  String get login_facebook => 'تسجيل الدخول باستخدام Facebook';

  @override
  String get login_description => 'تطبيق تجريبي';

  @override
  String get webview => 'عرض الويب';

  @override
  String get webview_recent => 'الأخيرة';

  @override
  String get webview_no_recent => 'لا توجد روابط حديثة بعد!';

  @override
  String get webview_first_url_title =>
      'قم بتعيين الرابط الأول باستخدام أيقونة التحرير في شريط التطبيق';

  @override
  String get webview_first_url_description =>
      'يمكنك أيضًا تغييره في الإعدادات!';

  @override
  String get webview_cancel => 'إلغاء';

  @override
  String get webview_save => 'حفظ';

  @override
  String get webview_invalid_url => 'رابط غير صالح. حاول مرة أخرى!';

  @override
  String get network_devices_bluetooth_off =>
      'تم إيقاف تشغيل البلوتوث. يرجى تشغيله لمسح الأجهزة.';

  @override
  String get network_devices_select_device => 'اختر جهازًا';

  @override
  String get network_devices_unknown_device => '(جهاز غير معروف)';

  @override
  String get network_devices_connect => 'اتصال';

  @override
  String get network_devices_cancel => 'إلغاء';

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
  String get settings_webview => 'عرض الويب';

  @override
  String get settings_webview_configure => 'تكوين الرابط';

  @override
  String get settings_network_devices => 'الأجهزة الشبكية';

  @override
  String get settings_configure => 'تكوين الأجهزة المتصلة';

  @override
  String get settings_logout => 'تسجيل الخروج';
}
