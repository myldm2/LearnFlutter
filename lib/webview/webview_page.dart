import "package:flutter_webview_plugin/flutter_webview_plugin.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebView extends StatelessWidget {
  final String url;
  final String title;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  WebView({this.url, this.title});

  @override
  Widget build(BuildContext context) {
    // flutterWebviewPlugin.onStateChanged.listen((event) {
    //   // switch (event.type) {
    //   //   case WebViewState.finishLoad:
    //   //     Fluttertoast.showToast(
    //   //         msg: "加载中...",
    //   //         toastLength: Toast.LENGTH_SHORT,
    //   //         gravity: ToastGravity.CENTER,
    //   //         timeInSecForIos: 1,
    //   //         bgcolor: "#e74c3c",
    //   //         textcolor: '#ffffff');
    //   //     break;

    //   //   default:
    //   //     break;
    //   // }
    // });

    return new WebviewScaffold(
      url: url != null ? url : "",
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text(title != null ? title : ""),
      ),
    );
  }
}
