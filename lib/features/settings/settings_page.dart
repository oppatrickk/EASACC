import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/login/login_page.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(),
            Spacer(),
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
