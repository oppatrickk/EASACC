import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/features/webview/webview_page.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.title,
    this.backgroundColor,
    this.border,
    this.textColor,
    required this.icon,
  });

  final String title;
  final String icon;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacement(const WebViewPage());
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.surface,
              borderRadius: BorderRadius.circular(32),
              border: border,
            ),
            child: Row(
              children: <Widget>[
                Image.asset(icon, width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(color: textColor ?? context.colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
