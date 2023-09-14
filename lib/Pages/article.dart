import 'package:flutter/material.dart';

import 'package:news_app/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatefulWidget {
  final String postUrl;
  ArticleView({super.key, required this.postUrl});

  @override
  State<ArticleView> createState() => _ArticleState();
}


class _ArticleState extends State<ArticleView> {

  @override
  Widget build(BuildContext context) {

    final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.postUrl));
    // ..loadRequest(Uri.parse("https://www.kindacode.com"));

    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}