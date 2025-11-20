import 'package:easacc/core/l10n/generated_translations/app_localizations.dart';
import 'package:flutter/material.dart';
// import 'package:portfolio/core/l10n/generated_translations/app_localizations.dart';

// Context Extension
extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension TextStyleX on TextStyle? {
  TextStyle get black => this?.copyWith(fontWeight: FontWeight.w900) ?? const TextStyle();
  TextStyle get extrabold => this?.copyWith(fontWeight: FontWeight.w800) ?? const TextStyle();
  TextStyle get bold => this?.copyWith(fontWeight: FontWeight.w700) ?? const TextStyle();
  TextStyle get semibold => this?.copyWith(fontWeight: FontWeight.w600) ?? const TextStyle();
  TextStyle get medium => this?.copyWith(fontWeight: FontWeight.w500) ?? const TextStyle();
  TextStyle get normal => this?.copyWith(fontWeight: FontWeight.w400) ?? const TextStyle();
  TextStyle get light => this?.copyWith(fontWeight: FontWeight.w300) ?? const TextStyle();
  TextStyle get extraLight => this?.copyWith(fontWeight: FontWeight.w200) ?? const TextStyle();
  TextStyle get thin => this?.copyWith(fontWeight: FontWeight.w100) ?? const TextStyle();
}

// Color Extension
extension CustomColorScheme on ColorScheme {
  // Shortcuts
  Color get text => onSurface;

  // Custom colors
  Color get brand => Brightness.light == brightness ? const Color(0xFF05A8AD) : const Color(0xFF0A6F73);
  Color get facebook => const Color(0xFF1877F2);

  // Fixed Colors
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
}

// Navigation Extension
extension NavigatorContext on BuildContext {
  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop(result);
  }

  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  Future<T?> pushReplacement<T extends Object?>(Widget page) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }
}
