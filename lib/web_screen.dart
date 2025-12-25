import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final webUrl = 'https://microfearch.netlify.app';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Web Screen')),
        body: InAppWebView(initialUrlRequest: URLRequest(url: WebUri(webUrl))),
      ),
    );
  }
}
