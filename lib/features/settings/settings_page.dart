import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/services/theme_service.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/login/login_page.dart';
import 'package:easacc/features/settings/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: CustomIcon(
                icon: CustomIconData.arrowLeft,
                size: 24,
                color: context.colorScheme.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            Text(
              'Settings',
              style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.white),
            ),
          ],
        ),
        leadingWidth: 180,
        backgroundColor: context.colorScheme.brand,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'GENERAL',
              style: context.textTheme.bodySmall?.semibold.copyWith(color: context.colorScheme.text),
            ),
            SettingsItem(
              title: 'Language',
              icon: CustomIconData.language,
            ),
            Consumer<ThemeService>(
              builder: (BuildContext context, ThemeService themeService, Widget? child) {
                bool isDarkMode;
                if (themeService.themeMode == ThemeMode.system) {
                  final Brightness brightness = MediaQuery.of(context).platformBrightness;
                  isDarkMode = brightness == Brightness.dark;
                } else {
                  isDarkMode = themeService.themeMode == ThemeMode.dark;
                }

                return SettingsItem(
                  onTap: () {
                    if (themeService.themeMode == ThemeMode.dark || (themeService.themeMode == ThemeMode.system && isDarkMode)) {
                      themeService.setThemeMode(ThemeMode.light);
                    } else {
                      themeService.setThemeMode(ThemeMode.dark);
                    }
                  },
                  widget: Row(
                    children: <Widget>[
                      Text(
                        isDarkMode ? 'Dark' : 'Light',
                        style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  title: 'Theme Mode',
                  icon: CustomIconData.theme,
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              'WEBVIEW',
              style: context.textTheme.bodySmall?.semibold.copyWith(color: context.colorScheme.text),
            ),
            SettingsItem(
              title: 'Configure URL',
              icon: CustomIconData.url,
            ),
            const SizedBox(height: 32),
            Text(
              'NETWORK DEVICES',
              style: context.textTheme.bodySmall?.semibold.copyWith(color: context.colorScheme.text),
            ),
            SettingsItem(
              title: 'Configure Connected Devices',
              icon: CustomIconData.devices,
            ),
            Spacer(),
            Center(
              child: Text(
                ' © John Patrick Prieto',
                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.text),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                context.pushReplacement(const LoginPage());
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
                side: WidgetStateProperty.all<BorderSide>(BorderSide(color: context.colorScheme.error, width: 1.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
