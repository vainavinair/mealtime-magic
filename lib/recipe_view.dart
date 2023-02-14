// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  late String url;
  RecipeView(this.url);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late String url;
  @override
  void initState() {
    super.initState();
    if (widget.url.toString().contains("http://")) {
      url = widget.url.toString().replaceAll("http://", "https://");
    } else {
      url = widget.url.toString();
    }
  }

  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mealtime Magic"),
      ),
      body: Container(
        child: (WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        )),
      ),
    );
  }
}
