import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebView extends StatelessWidget {
  final String webUrl, title;

  const CustomWebView({super.key, required this.webUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    log(webUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        // backgroundColor: AppBarTheme.of(context).backgroundColor,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(webUrl)),
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(
              action: ServerTrustAuthResponseAction.PROCEED);
        },
      ),
    );
  }
}
