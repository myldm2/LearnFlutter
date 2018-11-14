import 'package:flutter/material.dart';
import 'package:learn_flutter/main_page/main_page.dart';
import 'package:learn_flutter/home_page/home_page.dart';
import "package:flutter_webview_plugin/flutter_webview_plugin.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 255, 44, 102),
      ),
      home: HomePage(),
      // home: MainPage(),
    );
  }
}
