import 'package:easacc/core/enums/custom_icon_data.dart';
import 'package:easacc/core/utils/extensions.dart';
import 'package:easacc/core/widgets/custom_icon.dart';
import 'package:easacc/features/settings/settings_page.dart';
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

  @override
  void initState() {
    super.initState();
    loadWebView();
  }

  Future<void> loadWebView() async {
    controller = WebViewController();

    setState(() {
      isLoading = true;
    });

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

    await controller.loadRequest(Uri.parse('https://flutter.dev'));

    setState(() {
      isLoading = false;
    });
  }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
