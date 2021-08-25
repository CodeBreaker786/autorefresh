import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'package:autorefresh/database/moor_curd.dart';
import 'package:autorefresh/database/site_curd/site_curd.dart';
import 'package:autorefresh/screens/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import "dart:math";

import '../loading_utils.dart';

class WebViewScreen extends StatefulWidget {
  var db;
  late SitesDao siteDao;

  final Site? site;
  WebViewScreen({Key? key, this.site}) : super(key: key) {
    db = AppDatabase();
    FlutterAppBadger.updateBadgeCount(0);
    siteDao = SitesDao(db);
  }

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  CountDownController _countDownController = CountDownController();
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  bool isFirstTime = true;
  int _duration = 0;
  int sessionCount = 0;
  bool isError = false;
  Random random = Random();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  late ContextMenu contextMenu;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _callback();
    });
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          // webViewController?.reload();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Site"),
        backgroundColor: Colors.green,
      ),
      body: InAppWebView(
        key: webViewKey,
        // contextMenu: contextMenu,
        initialUrlRequest: URLRequest(url: Uri.parse(widget.site!.url!)),
        // initialFile: "assets/index.html",
        initialUserScripts: UnmodifiableListView<UserScript>([]),
        initialOptions: options,
        pullToRefreshController: pullToRefreshController,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {},
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },

        onLoadStop: (controller, url) async {
          pullToRefreshController.endRefreshing();
        },

        onLoadError: (controller, url, code, message) async {
          Future.delayed(Duration(seconds: 1), () {
            showError(error: message + "\n" + code.toString());
            _countDownController.restart(duration: 0);
          });

          isError = true;

          pullToRefreshController.endRefreshing();
        },
        onProgressChanged: (controller, progress) async {
          if (progress < 89) {

            showLoagingWithProgress(
                message: isFirstTime ? "Loading... " : "Reloading.... ",
                progress: progress / 89);
                
          } else {
            isFirstTime = false;
            await EasyLoading.dismiss();
          }
        },

        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: CircularCountDownTimer(
          initialDuration: 0,
          duration: _duration,
          controller: _countDownController,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.green[300]!,
          fillGradient: null,
          backgroundColor: Colors.green[500],
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.butt,
          textStyle: TextStyle(
              fontSize: widget.site!.hours == 0 ? 12 : 8,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          textFormat: widget.site!.hours == 0
              ? CountdownTextFormat.MM_SS
              : CountdownTextFormat.HH_MM_SS,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {},
          onComplete: () {
            print('Countdown Ended');
          },
        ),
        onPressed: () async {},
      ),
    );
  }

  Future<void> _callback() async {
    try {
      if (!isError) {
        final hour =
            widget.site!.hours == 0 ? 0 : Random().nextInt(widget.site!.hours!);
        final mint = widget.site!.mintue == 0
            ? 0
            : Random().nextInt(widget.site!.mintue!);
        final second = Random().nextInt(60);
        print(mint);
        print(second);
        _duration = (mint * 60) + second + (hour == 0 ? 0 : hour * 60 * 60);
        _countDownController.restart(duration: _duration);
        print(mint * 60 + second + hour == 0 ? 0 : hour * 60 * 60);
        await Future.delayed(
            Duration(
              hours: hour,
              minutes: mint,
              seconds: second,
            ), () async {
          await webViewController!.reload();
          sessionCount++;
          FlutterAppBadger.updateBadgeCount(sessionCount);
          await widget.siteDao.updateSite(widget.site!
              .copyWith(totalReloadCount: widget.site!.totalReloadCount! + 1));
        });
      }
    } finally {
      if (!isError) {
        _callback();
      }
    }
  }
}
