// Developer: Samuel Adekunle
// YouTube Tutorial: https://youtube.com/playlist?list=PLMfrNHAjWCoB6roLO1soz6RMc5BdnU9pk
// Join My Discord Server to ask question: https://discord.gg/95w942N6Ts
// Follow me on Twitter: https://twitter.com/techwithsam_

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'webview/example2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await FlutterDownloader.initialize(
      debug: false); // set true to enable printing logs to console
  await Permission.storage
      .request(); // ask for storage permission on app create

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _url = "https://benerinmotor.com/mobile/public/login";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BENERIN Motor',
      theme: ThemeData(
          primarySwatch: Colors.blue, visualDensity: VisualDensity.standard),
      debugShowCheckedModeBanner: false,
      home: WebExampleTwo(url: _url),
      //home: HomePage(),
    );
  }
}
