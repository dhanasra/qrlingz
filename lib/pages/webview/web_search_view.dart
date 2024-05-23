import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSearchView extends StatefulWidget {
  final String value;
  const WebSearchView({super.key, required this.value});

  @override
  State<WebSearchView> createState() => _WebSearchViewState();
}

class _WebSearchViewState extends State<WebSearchView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: WebViewWidget(
      controller: WebViewController()..runJavaScriptReturningResult("self.find('${widget.value}')"),
    ),
  );
  }
}