import 'dart:convert';
import 'dart:io';
import 'package:learn_flutter/models/message_model.dart';

final dataCore = new DataCore();

typedef void DataCoreCallback(List<MessageCardModel> datas);

class DataCore {
  var datas = <MessageCardModel>[];
  var mapData = <String, MessageCardModel>{};

  requestData(DataCoreCallback callBack) async {
    var conditions = <String>[
      "抽 一名",
      "抽 1名",
    ];

    for (int j = 0; j < conditions.length; j++) {
      var condition = conditions[j];
      for (int i = 0; i < 20; i++) {
        await loadData(condition, i);
      }
    }

    callBack(this.datas);
  }

  loadData(String keyword, int page) async {
    String containerid =
        "100103type%3d61%26q%3d" + Uri.encodeFull(keyword) + "%26t%3d0";

    var url = 'https://m.weibo.cn/api/container/getIndex?containerid=' +
        containerid +
        '&page_type=searchall&page=$page';

    print(url);

    var httpClient = new HttpClient();

    String result;
    MessageModel model;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonString = await response.transform(utf8.decoder).join();
        Map data = json.decode(jsonString);
        // result = data['origin'];
        var m = new MessageModel.fromJson(data);
        result = m.ok.toString();
        model = m;
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
        print("mayinglun log: decode error");
      }
    } catch (exception) {
      result = exception.toString();
      print("mayinglun log: $result");
    }

    if (model != null) {
      if (model.data.cards.length > 0) {
        model.data.cards.forEach((cardsModel) {
          cardsModel.card_group.forEach((model) {
            this.saveIfNeeded(model);
          });
        });
      }
    }
  }

  saveIfNeeded(MessageCardModel data) {
    if (this.mapData[data.getIdKey()] == null) {
      this.datas.add(data);
      this.mapData[data.getIdKey()] = data;
    }
  }
}
