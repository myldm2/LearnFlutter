import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClassPage extends StatefulWidget {
  ClassPage({Key key}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  // Default placeholder text
  String textToShow = "B";
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: const Color(0xFFFF0066),
        middle: new Text("Title"),
        trailing: Container(
          width: 22.0,
          height: 30.0,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              "images/icon_二维码@2x.png",
              width: 22.0,
              height: 22.0,
            ),
            onPressed: () {
              // do nothing
            },
          ),
        ),
      ),
      child: Center(child: Text(textToShow)),
    );
  }
}
