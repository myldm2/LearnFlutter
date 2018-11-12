import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learn_flutter/Model/message_model.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // Default placeholder text
  String textToShow = "A";

@override
  void initState() {
    super.initState();
    _loadData();
  }

  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Text(textToShow);
  }

  _loadData() async {
    var url = 'https://m.weibo.cn/api/container/getIndex?containerid=100103type%3D61%26q%3D%E8%80%81E%26t%3D0&page_type=searchall';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonString = await response.transform(utf8.decoder).join();
        Map data = json.decode(jsonString);
        // result = data['origin'];
        var model = new MessageModel.fromJson(data);
        result = model.ok.toString();
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    // var str = Uri.encodeFull("没22");
    var type = result.runtimeType;

    setState(() {
      textToShow = result;
      print(type);
      print("mayinglun log:");
    });
  }

  

}
