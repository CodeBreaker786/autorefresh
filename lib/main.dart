import 'dart:async';

import 'package:autorefresh/browser/webview_screen.dart';
import 'package:autorefresh/loading_utils.dart';
import 'package:autorefresh/screens/reload_duration_screen.dart';
import 'package:autorefresh/screens/site_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  config();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.green,
        primarySwatch: Colors.blue,
      ),
      home: SiteListScreen(),
      builder: EasyLoading.init(),
    );
  }
}
