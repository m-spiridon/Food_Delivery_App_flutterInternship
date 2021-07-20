import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModalBlogWindow extends StatelessWidget {
  
  final url;
  final blogTitle;

  ModalBlogWindow({
    this.blogTitle,
    this.url
  }); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogTitle),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
