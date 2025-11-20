import 'package:easacc/core/l10n/generated_translations/app_localizations.dart';
import 'package:easacc/core/l10n/l10n.dart';
import 'package:easacc/core/services/theme_service.dart';
import 'package:easacc/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    final _AppWidgetState? state = context.findAncestorStateOfType<_AppWidgetState>();
    state?.setLocale(locale);
  }

  static Locale? getLocale(BuildContext context) {
    final _AppWidgetState? state = context.findAncestorStateOfType<_AppWidgetState>();
    return state?._locale;
  }

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _locale = L10n.all[0];
    _loadLocale();
  }

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;
    setState(() => _locale = newLocale);
    await _saveLocale(newLocale);
  }

  Future<void> _loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? saved = prefs.getString('locale');

    if (saved != null) {
      final List<String> parts = saved.split('_');
      setState(() {
        _locale = parts.length > 1 && parts[1].isNotEmpty ? Locale(parts[0], parts[1]) : Locale(parts[0]);
      });
    }
  }

  Future<void> _saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'locale',
      '${locale.languageCode}_${locale.countryCode ?? ''}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ThemeService>(create: (_) => ThemeService()),
      ],
      child: Consumer<ThemeService>(
        builder: (BuildContext context, ThemeService themeService, Widget? child) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            debugShowCheckedModeBanner: false,
            title: 'EASACC Task Demo App',
            theme: ThemeData(useMaterial3: true, colorScheme: themeService.lightScheme, fontFamily: 'Poppins'),
            darkTheme: ThemeData(useMaterial3: true, colorScheme: themeService.darkScheme, fontFamily: 'Poppins'),
            themeMode: themeService.themeMode,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
