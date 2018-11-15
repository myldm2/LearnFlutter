import 'dart:convert';
import 'dart:io';
import 'package:learn_flutter/models/message_model.dart';

final dataCore = new DataCore();

typedef void DataCoreCallback(List<MessageCardModel> datas);

class DataCore {
  var datas = <MessageCardModel>[];

  requestData(DataCoreCallback callBack) async {
    var url =
        'https://m.weibo.cn/api/container/getIndex?containerid=100103type%3d61%26q%3d%e8%bd%ac%e5%8f%91%26t%3d0&page_type=searchall';
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
            this.datas.add(model);
          });
        });
      }
    } else {
      print("mayinglun log: model is null");
    }

    callBack(this.datas);
  }
}
