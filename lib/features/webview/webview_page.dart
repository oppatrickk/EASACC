import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/settings/settings_page.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WebView',
          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.white),
        ),
        backgroundColor: context.colorScheme.brand,
        actions: <Widget>[
          IconButton(
            icon: CustomIcon(
              icon: CustomIconData.edit,
              size: 24,
              color: context.colorScheme.white,
            ),
            onPressed: () => <dynamic, dynamic>{},
          ),
          IconButton(
            icon: CustomIcon(
              icon: CustomIconData.settings,
              size: 24,
              color: context.colorScheme.white,
            ),
            onPressed: () => context.push(const SettingsPage()),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
