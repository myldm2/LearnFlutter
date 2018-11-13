import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:learn_flutter/models/message_model.dart';

class HomeListCell extends StatelessWidget {
  final MessageCardModel data;

  HomeListCell({this.data});

  @override
  Widget build(BuildContext context) {
    var name =
        data.mblog.user.screen_name == null ? "" : data.mblog.user.screen_name;
    var createdAt = data.mblog.created_at == null ? "" : data.mblog.created_at;
    var mbText = data.mblog.text == null ? "" : data.mblog.text;

    List<Widget> items = [];
    var headWigdt = _headerWidget(data);
    if (headWigdt != null) {
      items.add(headWigdt);
    }

    var wbWidget = _wbWidget(data);
    if (wbWidget != null) {
      items.add(wbWidget);
    }

    var reweetWidget = _reweetWidget(data);
    if (reweetWidget != null) {
      items.add(reweetWidget);
    }

    items.add(new Container(
      height: 10.0,
      color: const Color(0xFFEEEEEE),
    ));

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }

  Widget _headerWidget(MessageCardModel model) {
    var name =
        model.mblog.user.screen_name == null ? "" : data.mblog.user.screen_name;
    var createdAt = model.mblog.created_at == null ? "" : data.mblog.created_at;
    return new ListTile(
      leading: new Container(
        width: 30.0,
        height: 30.0,
        padding: const EdgeInsets.all(0.0),
        child: new ClipOval(
          child: Image.network("${data.mblog.user.avatar_hd}"),
        ),
      ),
      title: new Text(
        name,
        style: new TextStyle(
          fontSize: 14.0,
        ),
      ),
      subtitle: new Text(
        createdAt,
        style: new TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget _wbWidget(MessageCardModel model) {
    var mbText = model.mblog.text == null ? "" : data.mblog.text;
    return new GestureDetector(
      onTap: () {
        print("tap action");
      },
      child: new Container(
        width: 1000.0,
        child: new HtmlText(data: mbText),
      ),
    );
  }

  Widget _reweetWidget(MessageCardModel model) {
    if (model.mblog.retweeted_status != null) {
      var screen_name =
          "<a>@${model.mblog.retweeted_status.user.screen_name}:</a>";
      var mbText = model.mblog.retweeted_status.text;

      return new GestureDetector(
        onTap: () {
          print("tap action");
        },
        child: new Container(
          width: 1000.0,
          color: const Color(0xFFF3F3E3),
          child: new HtmlText(data: "$screen_name $mbText"),
        ),
      );
    }
    return null;
  }
}
