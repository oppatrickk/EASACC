import 'package:easacc/app/app.dart';
import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/services/shared_preference_service.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/settings/settings_page.dart';
import 'package:easacc/features/webview/widgets/web_view_input.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool isLoading = true;
  String currentURL = '';

  @override
  void initState() {
    super.initState();
    loadWebView();
  }

  String fixUrl(String url) {
    url = url.trim();

    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }

    return url;
  }

  Future<void> loadWebView() async {
    controller = WebViewController();

    setState(() {
      isLoading = true;
    });

    currentURL = await SharedPreferenceService.getWebViewUrl() ?? '';

    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

    String safeUrl = fixUrl(currentURL);

    if (safeUrl.isNotEmpty) {
      await controller.loadRequest(Uri.parse(safeUrl));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Locale? locale = AppWidget.getLocale(context);
    final bool isArabic = locale?.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.webview,
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
            onPressed: () async {
              final String? result = await showDialog(
                context: context,
                builder: (_) => WebViewInput(),
              );
              if (result == null) return;

              await SharedPreferenceService.saveWebViewUrl(result);

              setState(() {
                isLoading = true;
                currentURL = result;
              });

              String safeUrl = fixUrl(currentURL);

              if (safeUrl.isNotEmpty) {
                await controller.loadRequest(Uri.parse(safeUrl));
              }

              setState(() {
                isLoading = false;
              });
            },
          ),
          IconButton(
            icon: CustomIcon(
              icon: CustomIconData.settings,
              size: 24,
              color: context.colorScheme.white,
            ),
            onPressed: () async {
              final bool? updated = await context.push<bool>(const SettingsPage());

              if (updated == true) {
                final String? url = await SharedPreferenceService.getWebViewUrl();
                if (url == null) return;
                setState(() {
                  isLoading = true;
                  currentURL = url;
                });

                String safeUrl = fixUrl(currentURL);

                if (safeUrl.isNotEmpty) {
                  await controller.loadRequest(Uri.parse(safeUrl));
                }

                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : currentURL == '' || currentURL.trim().isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.surfaceContainer,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CustomIcon(
                          icon: CustomIconData.noUrl,
                          size: 24,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      context.l10n.webview_first_url_title,
                      style: context.textTheme.titleLarge.semibold.copyWith(color: context.colorScheme.text),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.webview_first_url_description,
                      style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : WebViewWidget(
              controller: controller,
              layoutDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            ),
    );
  }
}
