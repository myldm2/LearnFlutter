import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:learn_flutter/models/message_model.dart';
import 'package:learn_flutter/webview/webview_page.dart';

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
    var headWigdt = _headerWidget(context, data);
    if (headWigdt != null) {
      items.add(headWigdt);
    }

    var wbWidget = _wbWidget(context, data);
    if (wbWidget != null) {
      items.add(wbWidget);
    }

    var reweetWidget = _reweetWidget(context, data);
    if (reweetWidget != null) {
      items.add(reweetWidget);
    }

    var wbImageWidget = _wbImageWidget(context, data);
    if (reweetWidget != null && wbImageWidget != null) {
      items.add(wbImageWidget);
    }

    var reweetImageWidget = _reweetImageWidget(context, data);
    if (reweetImageWidget != null) {
      items.add(reweetImageWidget);
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

  Widget _headerWidget(BuildContext context, MessageCardModel model) {
    var name =
        model.mblog.user.screen_name == null ? "" : data.mblog.user.screen_name;
    var createdAt = model.mblog.created_at == null ? "" : data.mblog.created_at;
    var header = new ListTile(
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
    return new GestureDetector(
      onTap: () {
        gotoWb(context, model.mblog.idstr);
      },
      child: new Container(
        width: 1000.0,
        child: header,
      ),
    );
  }

  Widget _wbWidget(BuildContext context, MessageCardModel model) {
    var mbText = model.mblog.text == null ? "" : data.mblog.text;

    return new GestureDetector(
      onTap: () {
        gotoWb(context, model.mblog.idstr);
      },
      child: new Container(
        width: 1000.0,
        child: new HtmlText(data: mbText),
      ),
    );
  }

  Widget _wbImageWidget(BuildContext context, MessageCardModel model) {
    if (model.mblog.retweeted_status != null) {
      if (model.mblog.original_pic != null) {
        var imageModel = model.mblog.original_pic;
        if (imageModel.length > 0) {
          var imageWidget = new Image.network(
            imageModel,
            fit: BoxFit.cover,
          );
          var imageContainer = new Container(
            child: imageWidget,
            width: 100.0,
            height: 100.0,
          );

          var container = new Container(
            width: 1000.0,
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: <Widget>[imageContainer],
            ),
          );

          return new GestureDetector(
            onTap: () {
              gotoWb(context, model.mblog.retweeted_status.idstr);
            },
            child: container,
          );
        }
      }
    }
    return null;
  }

  Widget _reweetWidget(BuildContext context, MessageCardModel model) {
    if (model.mblog.retweeted_status != null) {
      var screen_name =
          "<a>@${model.mblog.retweeted_status.user.screen_name}:</a>";
      var mbText = model.mblog.retweeted_status.text;

      return new GestureDetector(
        onTap: () {
          gotoWb(context, model.mblog.retweeted_status.idstr);
        },
        child: new Container(
          width: 1000.0,
          color: const Color(0xFFE8F5E9),
          child: new HtmlText(data: "$screen_name $mbText"),
        ),
      );
    }
    return null;
  }

  Widget _reweetImageWidget(BuildContext context, MessageCardModel model) {
    if (model.mblog.retweeted_status != null) {
      if (model.mblog.retweeted_status.pics != null) {
        var imageModes = model.mblog.retweeted_status.pics;
        if (imageModes.length > 0) {
          List<Widget> imageWidgets = [];
          imageModes.forEach((image) {
            var imageWidget = new Image.network(
              image.url,
              fit: BoxFit.cover,
            );
            var container = new Container(
              child: imageWidget,
              width: 100.0,
              height: 100.0,
            );
            imageWidgets.add(container);
          });

          var container = new Container(
            width: 1000.0,
            color: const Color(0xFFE8F5E9),
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: imageWidgets,
            ),
          );

          return new GestureDetector(
            onTap: () {
              gotoWb(context, model.mblog.retweeted_status.idstr);
            },
            child: container,
          );
        }
      }
    }
    return null;
  }

  gotoWb(BuildContext context, String wbId) {
    if (wbId != null && wbId.length > 0) {
      print("mayinglun log create webview");
      var wbUrl = "https://m.weibo.cn/detail/" + wbId;
      Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new WebView(url: wbUrl, title: "网页");
        },
      ));
    }
  }
}
