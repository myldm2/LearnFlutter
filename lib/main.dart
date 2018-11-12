import 'package:flutter/material.dart';
import 'package:learn_flutter/main_page/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // primaryColor: Color.fromARGB(255, 255, 0, 102),
      ),
      home: MainPage(),
    );
  }
}