import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/message_model.dart';
import 'home_list_cell.dart';
import 'package:learn_flutter/core/data_core.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // Default placeholder text
  String textToShow = "加载中...";
  var _datas = <MessageCardModel>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_datas != null) {
      List<MessageCardModel> cardList = <MessageCardModel>[];
      if (_datas.length > 0) {
        cardList = _datas;
      }

      if (cardList != null) {
        return new ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return new HomeListCell(data: cardList[index]);
          },
        );
      } else {
        return new Center(
          child: new Text("暂无数据"),
        );
      }
    } else {
      return new Center(
        child: new Text("$textToShow"),
      );
    }
  }

  _loadData() {
    dataCore.requestData((model) {
      if (model == null) {
        print("mayinglun log: model is null");
      } else {
        print("mayinglun log: ${model.length}");
      }

      setState(() {
        _datas = model;
      });
    });

    //   var url =
    //       'https://m.weibo.cn/api/container/getIndex?containerid=100103type%3d61%26q%3d%e8%bd%ac%e5%8f%91%26t%3d0&page_type=searchall';
    //   var httpClient = new HttpClient();

    //   String result;
    //   MessageModel model;
    //   try {
    //     var request = await httpClient.getUrl(Uri.parse(url));
    //     var response = await request.close();
    //     if (response.statusCode == HttpStatus.ok) {
    //       var jsonString = await response.transform(utf8.decoder).join();
    //       Map data = json.decode(jsonString);
    //       // result = data['origin'];
    //       var m = new MessageModel.fromJson(data);
    //       result = m.ok.toString();
    //       model = m;
    //     } else {
    //       result =
    //           'Error getting IP address:\nHttp status ${response.statusCode}';
    //     }
    //   } catch (exception) {
    //     result = exception.toString();
    //   }

    //   // If the widget was removed from the tree while the message was in flight,
    //   // we want to discard the reply rather than calling setState to update our
    //   // non-existent appearance.
    //   if (!mounted) return;

    //   // var str = Uri.encodeFull("没22");
    //   // var type = result.runtimeType;

    //   setState(() {
    //     textToShow = result;
    //     _model = model;
    //   });
  }
}
