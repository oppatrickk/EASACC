import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/features/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Container(
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
                          'English',
                          style: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.white),
                        ),
                      ],
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
                        'TASK DEMO APPICATION',
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
                      title: 'Login with Google',
                      icon: 'assets/img/google_logo.png',
                      border: Border.all(
                        color: context.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LoginButton(
                      icon: 'assets/img/facebook_logo.png',
                      title: 'Login with facebook',
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
