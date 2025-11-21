import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/services/shared_preference_service.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class WebViewInput extends StatefulWidget {
  const WebViewInput({
    super.key,
  });

  @override
  State<WebViewInput> createState() => _WebViewInputState();
}

class _WebViewInputState extends State<WebViewInput> {
  late TextEditingController controller;
  bool invalidUrl = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    SharedPreferenceService.getWebViewUrl().then((String? value) => controller.text = value ?? '');
  }

  bool isValidHttpUrl(String url) {
    final String trimmed = url.trim();

    // If it's missing scheme, add https://
    final String normalized = trimmed.startsWith('http://') || trimmed.startsWith('https://') ? trimmed : 'https://$trimmed';

    final Uri? uri = Uri.tryParse(normalized);

    // Must be absolute AND have a valid host
    return uri != null && uri.hasScheme && uri.hasAuthority && (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.contains('.');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(24),
      title: Row(
        children: <Widget>[
          Text(context.l10n.webview, style: context.textTheme.titleLarge?.semibold.copyWith(color: context.colorScheme.primary)),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: CustomIcon(
              icon: CustomIconData.cancel,
              size: 24,
              color: context.colorScheme.text,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CustomIcon(
                icon: CustomIconData.url,
                size: 16,
                color: context.colorScheme.text,
              ),
              const SizedBox(width: 4),
              Text(
                context.l10n.settings_webview_configure.toUpperCase(),
                style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.text),
              ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: 'https://example.com',
                hintStyle: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
              ),
              maxLines: 1,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.text),
              onChanged: (String value) => setState(() {
                invalidUrl = false;
              }),
              autofocus: true,
              keyboardType: TextInputType.url,
            ),
          ),
          if (invalidUrl == true) ...<Widget>[
            const SizedBox(height: 16),
            Text(
              context.l10n.webview_invalid_url,
              style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.error),
            ),
          ],
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(context.l10n.webview_cancel, style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.secondary)),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: controller.text.isEmpty ? context.colorScheme.outline : context.colorScheme.primary,
          ),
          child: Text(
            context.l10n.webview_save.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(color: context.colorScheme.onPrimary),
          ),
          onPressed: () {
            final String text = controller.text.trim();
            if (text.isEmpty) return;

            if (!isValidHttpUrl(text)) {
              setState(() {
                invalidUrl = true;
              });
              return;
            }

            Navigator.pop(context, text);
          },
        ),
      ],
    );
  }
}
