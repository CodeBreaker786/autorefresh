import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../loading_utils.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Site"),
        backgroundColor: Colors.green,
      ),
      body: WebView(
        initialUrl: 'https://www.fiverr.com/users',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        onProgress: (int progress) {
          showLoagingWithProgress(
              message: "Reloading....", progress: progress / 100);
        },
        javascriptChannels: <JavascriptChannel>{
          // _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) async {
          await EasyLoading.dismiss();
        },
        gestureNavigationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Timer.periodic(Duration(seconds: 8), (timer) async {
            await _controller.reload();
          });
        },
      ),
    );
  }
}
