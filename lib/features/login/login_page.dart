import 'package:easacc/app/app.dart';
import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Locale? locale = AppWidget.getLocale(context);
    final bool isEnglish = locale?.languageCode == 'en';

    return Scaffold(
      backgroundColor: context.colorScheme.brand,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'John Patrick Prieto',
                    style: context.textTheme.titleMedium?.semibold.copyWith(color: context.colorScheme.onPrimaryContainer),
                  ),
                  InkWell(
                    onTap: () async {
                      AppWidget.setLocale(
                        context,
                        isEnglish ? const Locale('ar') : const Locale('en'),
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.onPrimaryContainer.withAlpha(100),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: context.colorScheme.white,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            isEnglish ? 'English' : 'Arabic',
                            style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.white),
                          ),
                          const SizedBox(width: 8),
                          CustomIcon(
                            icon: CustomIconData.chevronDown,
                            size: 24,
                            color: context.colorScheme.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/img/wordmark.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.onPrimaryContainer.withAlpha(100),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        context.l10n.login_description,
                        style: context.textTheme.bodySmall?.bold.copyWith(color: context.colorScheme.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    LoginButton(
                      title: context.l10n.login_google,
                      icon: 'assets/img/google_logo.png',
                      border: Border.all(
                        color: context.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LoginButton(
                      icon: 'assets/img/facebook_logo.png',
                      title: context.l10n.login_facebook,
                      backgroundColor: context.colorScheme.facebook,
                      textColor: context.colorScheme.white,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
