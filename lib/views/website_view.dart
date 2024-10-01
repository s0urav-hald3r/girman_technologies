import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girman/config/constants.dart';
import 'package:girman/controllers/screen_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatefulWidget {
  const WebsiteView({super.key});

  @override
  State<WebsiteView> createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  late WebViewController controller;
  final screenController = ScreenController.instance;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            screenController.loadingWebView = progress != 100;
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (screenController.loadingWebView) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return WebViewWidget(controller: controller);
      }),
    );
  }
}
