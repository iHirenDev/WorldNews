import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsDetails extends StatelessWidget {

  final newsURL;

  NewsDetails({this.newsURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('DetailsView'),
          backgroundColor: Colors.deepPurple,
        ),
        
        body: WebView(
          initialUrl: this.newsURL,
          javascriptMode: JavascriptMode.unrestricted,
        ),
    );
  }
}