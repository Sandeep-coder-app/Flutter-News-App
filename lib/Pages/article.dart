import 'package:flutter/material.dart';

import 'package:news_app/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatefulWidget {
  final String? postUrl;
  ArticleView({super.key, this.postUrl});

  @override
  State<ArticleView> createState() => _ArticleState();
}


class _ArticleState extends State<ArticleView> {

  final WebViewController controller = WebViewController();

  @override
  Widget build(BuildContext context) {
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