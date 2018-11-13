import 'dart:convert' show json;

class MessageModel {
  int ok;
  MessageDataModel data;

  MessageModel.fromParams({this.ok, this.data});

  factory MessageModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MessageModel.fromJson(json.decode(jsonStr))
          : new MessageModel.fromJson(jsonStr);

  MessageModel.fromJson(jsonRes) {
    ok = jsonRes['ok'];
    data = jsonRes['data'] == null
        ? null
        : new MessageDataModel.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"ok": $ok,"data": $data}';
  }
}

class MessageDataModel {
  int showAppTips;
  String scheme;
  List<MessageCardsModel> cards;
  MessageCardListModel cardlistInfo;

  MessageDataModel.fromParams(
      {this.showAppTips, this.scheme, this.cards, this.cardlistInfo});

  MessageDataModel.fromJson(jsonRes) {
    showAppTips = jsonRes['showAppTips'];
    scheme = jsonRes['scheme'];
    cards = jsonRes['cards'] == null ? null : [];

    for (var cardsItem in cards == null ? [] : jsonRes['cards']) {
      cards.add(
          cardsItem == null ? null : new MessageCardsModel.fromJson(cardsItem));
    }

    cardlistInfo = jsonRes['cardlistInfo'] == null
        ? null
        : new MessageCardListModel.fromJson(jsonRes['cardlistInfo']);
  }

  @override
  String toString() {
    return '{"showAppTips": $showAppTips,"scheme": ${scheme != null ? '${json.encode(scheme)}' : 'null'},"cards": $cards,"cardlistInfo": $cardlistInfo}';
  }
}

class MessageCardListModel {
  int can_shared;
  int page;
  int show_style;
  int starttime;
  int total;
  String containerid;
  String page_size;
  String title_top;
  String v_p;
  List<MessageHeadCardModel> cardlist_head_cards;
  List<dynamic> cardlist_menus;
  List<dynamic> hide_oids;
  List<dynamic> toolbar_menus;

  MessageCardListModel.fromParams(
      {this.can_shared,
      this.page,
      this.show_style,
      this.starttime,
      this.total,
      this.containerid,
      this.page_size,
      this.title_top,
      this.v_p,
      this.cardlist_head_cards,
      this.cardlist_menus,
      this.hide_oids,
      this.toolbar_menus});

  MessageCardListModel.fromJson(jsonRes) {
    can_shared = jsonRes['can_shared'];
    page = jsonRes['page'];
    show_style = jsonRes['show_style'];
    starttime = jsonRes['starttime'];
    total = jsonRes['total'];
    containerid = jsonRes['containerid'];
    page_size = jsonRes['page_size'];
    title_top = jsonRes['title_top'];
    v_p = jsonRes['v_p'];
    cardlist_head_cards = jsonRes['cardlist_head_cards'] == null ? null : [];

    for (var cardlist_head_cardsItem
        in cardlist_head_cards == null ? [] : jsonRes['cardlist_head_cards']) {
      cardlist_head_cards.add(cardlist_head_cardsItem == null
          ? null
          : new MessageHeadCardModel.fromJson(cardlist_head_cardsItem));
    }

    cardlist_menus = jsonRes['cardlist_menus'] == null ? null : [];

    for (var cardlist_menusItem
        in cardlist_menus == null ? [] : jsonRes['cardlist_menus']) {
      cardlist_menus.add(cardlist_menusItem);
    }

    hide_oids = jsonRes['hide_oids'] == null ? null : [];

    for (var hide_oidsItem in hide_oids == null ? [] : jsonRes['hide_oids']) {
      hide_oids.add(hide_oidsItem);
    }

    toolbar_menus = jsonRes['toolbar_menus'] == null ? null : [];

    for (var toolbar_menusItem
        in toolbar_menus == null ? [] : jsonRes['toolbar_menus']) {
      toolbar_menus.add(toolbar_menusItem);
    }
  }

  @override
  String toString() {
    return '{"can_shared": $can_shared,"page": $page,"show_style": $show_style,"starttime": $starttime,"total": $total,"containerid": ${containerid != null ? '${json.encode(containerid)}' : 'null'},"page_size": ${page_size != null ? '${json.encode(page_size)}' : 'null'},"title_top": ${title_top != null ? '${json.encode(title_top)}' : 'null'},"v_p": ${v_p != null ? '${json.encode(v_p)}' : 'null'},"cardlist_head_cards": $cardlist_head_cards,"cardlist_menus": $cardlist_menus,"hide_oids": $hide_oids,"toolbar_menus": $toolbar_menus}';
  }
}

class MessageHeadCardModel {
  int head_type;
  String head_type_name;
  String menu_scheme;
  String show_menu;
  List<MessageChannelModel> channel_list;

  MessageHeadCardModel.fromParams(
      {this.head_type,
      this.head_type_name,
      this.menu_scheme,
      this.show_menu,
      this.channel_list});

  MessageHeadCardModel.fromJson(jsonRes) {
    head_type = jsonRes['head_type'];
    head_type_name = jsonRes['head_type_name'];
    menu_scheme = jsonRes['menu_scheme'];
    show_menu = jsonRes['show_menu'];
    channel_list = jsonRes['channel_list'] == null ? null : [];

    for (var channel_listItem
        in channel_list == null ? [] : jsonRes['channel_list']) {
      channel_list.add(channel_listItem == null
          ? null
          : new MessageChannelModel.fromJson(channel_listItem));
    }
  }

  @override
  String toString() {
    return '{"head_type": $head_type,"head_type_name": ${head_type_name != null ? '${json.encode(head_type_name)}' : 'null'},"menu_scheme": ${menu_scheme != null ? '${json.encode(menu_scheme)}' : 'null'},"show_menu": ${show_menu != null ? '${json.encode(show_menu)}' : 'null'},"channel_list": $channel_list}';
  }
}

class MessageChannelModel {
  int default_add;
  int must_show;
  String containerid;
  String id;
  String name;
  String scheme;

  MessageChannelModel.fromParams(
      {this.default_add,
      this.must_show,
      this.containerid,
      this.id,
      this.name,
      this.scheme});

  MessageChannelModel.fromJson(jsonRes) {
    default_add = jsonRes['default_add'];
    must_show = jsonRes['must_show'];
    containerid = jsonRes['containerid'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    scheme = jsonRes['scheme'];
  }

  @override
  String toString() {
    return '{"default_add": $default_add,"must_show": $must_show,"containerid": ${containerid != null ? '${json.encode(containerid)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"scheme": ${scheme != null ? '${json.encode(scheme)}' : 'null'}}';
  }
}

class MessageCardsModel {
  int card_type;
  int show_type;
  List<MessageCardModel> card_group;

  MessageCardsModel.fromParams(
      {this.card_type, this.show_type, this.card_group});

  MessageCardsModel.fromJson(jsonRes) {
    card_type = jsonRes['card_type'];
    show_type = jsonRes['show_type'];
    card_group = jsonRes['card_group'] == null ? null : [];

    for (var card_groupItem
        in card_group == null ? [] : jsonRes['card_group']) {
      card_group.add(card_groupItem == null
          ? null
          : new MessageCardModel.fromJson(card_groupItem));
    }
  }

  @override
  String toString() {
    return '{"card_type": $card_type,"show_type": $show_type,"card_group": $card_group}';
  }
}

class MessageCardModel {
  int card_type;
  int display_arrow;
  int show_type;
  String card_type_name;
  String itemid;
  String scheme;
  MessageActionModel actionlog;
  MessageMblogModel mblog;

  MessageCardModel.fromParams(
      {this.card_type,
      this.display_arrow,
      this.show_type,
      this.card_type_name,
      this.itemid,
      this.scheme,
      this.actionlog,
      this.mblog});

  MessageCardModel.fromJson(jsonRes) {
    card_type = jsonRes['card_type'];
    display_arrow = jsonRes['display_arrow'];
    show_type = jsonRes['show_type'];
    card_type_name = jsonRes['card_type_name'];
    itemid = jsonRes['itemid'];
    scheme = jsonRes['scheme'];
    actionlog = jsonRes['actionlog'] == null
        ? null
        : new MessageActionModel.fromJson(jsonRes['actionlog']);
    mblog = jsonRes['mblog'] == null
        ? null
        : new MessageMblogModel.fromJson(jsonRes['mblog']);
  }

  @override
  String toString() {
    return '{"card_type": $card_type,"display_arrow": $display_arrow,"show_type": $show_type,"card_type_name": ${card_type_name != null ? '${json.encode(card_type_name)}' : 'null'},"itemid": ${itemid != null ? '${json.encode(itemid)}' : 'null'},"scheme": ${scheme != null ? '${json.encode(scheme)}' : 'null'},"actionlog": $actionlog,"mblog": $mblog}';
  }
}

class MessageMblogModel {
  int attitudes_count;
  int comments_count;
  int content_auth;
  int hide_flag;
  int mblog_vip_type;
  int mblogtype;
  int more_info_type;
  int pending_approval_count;
  int pid;
  int reposts_count;
  int reward_exhibition_type;
  int show_additional_indication;
  int show_attitude_bar;
  int status;
  int weibo_position;
  bool can_edit;
  bool favorited;
  bool isLongText;
  bool is_paid;
  String bid;
  String created_at;
  String digit_attr;
  String id;
  String idstr;
  String itemid;
  String mid;
  String raw_text;
  String rid;
  String source;
  String text;
  MessageReweetedStatusModel retweeted_status;
  MessageUserModel user;
  MessageVisibleModel visible;

  MessageMblogModel.fromParams(
      {this.attitudes_count,
      this.comments_count,
      this.content_auth,
      this.hide_flag,
      this.mblog_vip_type,
      this.mblogtype,
      this.more_info_type,
      this.pending_approval_count,
      this.pid,
      this.reposts_count,
      this.reward_exhibition_type,
      this.show_additional_indication,
      this.show_attitude_bar,
      this.status,
      this.weibo_position,
      this.can_edit,
      this.favorited,
      this.isLongText,
      this.is_paid,
      this.bid,
      this.created_at,
      this.digit_attr,
      this.id,
      this.idstr,
      this.itemid,
      this.mid,
      this.raw_text,
      this.rid,
      this.source,
      this.text,
      this.retweeted_status,
      this.user,
      this.visible});

  MessageMblogModel.fromJson(jsonRes) {
    attitudes_count = jsonRes['attitudes_count'];
    comments_count = jsonRes['comments_count'];
    content_auth = jsonRes['content_auth'];
    hide_flag = jsonRes['hide_flag'];
    mblog_vip_type = jsonRes['mblog_vip_type'];
    mblogtype = jsonRes['mblogtype'];
    more_info_type = jsonRes['more_info_type'];
    pending_approval_count = jsonRes['pending_approval_count'];
    pid = jsonRes['pid'];
    reposts_count = jsonRes['reposts_count'];
    reward_exhibition_type = jsonRes['reward_exhibition_type'];
    show_additional_indication = jsonRes['show_additional_indication'];
    show_attitude_bar = jsonRes['show_attitude_bar'];
    status = jsonRes['status'];
    weibo_position = jsonRes['weibo_position'];
    can_edit = jsonRes['can_edit'];
    favorited = jsonRes['favorited'];
    isLongText = jsonRes['isLongText'];
    is_paid = jsonRes['is_paid'];
    bid = jsonRes['bid'];
    created_at = jsonRes['created_at'];
    digit_attr = jsonRes['digit_attr'];
    id = jsonRes['id'];
    idstr = jsonRes['idstr'];
    itemid = jsonRes['itemid'];
    mid = jsonRes['mid'];
    raw_text = jsonRes['raw_text'];
    rid = jsonRes['rid'];
    source = jsonRes['source'];
    text = jsonRes['text'];

    text = text.replaceAll("<br />", "\n");

    retweeted_status = jsonRes['retweeted_status'] == null
        ? null
        : new MessageReweetedStatusModel.fromJson(jsonRes['retweeted_status']);
    user = jsonRes['user'] == null
        ? null
        : new MessageUserModel.fromJson(jsonRes['user']);
    visible = jsonRes['visible'] == null
        ? null
        : new MessageVisibleModel.fromJson(jsonRes['visible']);
  }

  @override
  String toString() {
    return '{"attitudes_count": $attitudes_count,"comments_count": $comments_count,"content_auth": $content_auth,"hide_flag": $hide_flag,"mblog_vip_type": $mblog_vip_type,"mblogtype": $mblogtype,"more_info_type": $more_info_type,"pending_approval_count": $pending_approval_count,"pid": $pid,"reposts_count": $reposts_count,"reward_exhibition_type": $reward_exhibition_type,"show_additional_indication": $show_additional_indication,"show_attitude_bar": $show_attitude_bar,"status": $status,"weibo_position": $weibo_position,"can_edit": $can_edit,"favorited": $favorited,"isLongText": $isLongText,"is_paid": $is_paid,"bid": ${bid != null ? '${json.encode(bid)}' : 'null'},"created_at": ${created_at != null ? '${json.encode(created_at)}' : 'null'},"digit_attr": ${digit_attr != null ? '${json.encode(digit_attr)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"idstr": ${idstr != null ? '${json.encode(idstr)}' : 'null'},"itemid": ${itemid != null ? '${json.encode(itemid)}' : 'null'},"mid": ${mid != null ? '${json.encode(mid)}' : 'null'},"raw_text": ${raw_text != null ? '${json.encode(raw_text)}' : 'null'},"rid": ${rid != null ? '${json.encode(rid)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"text": ${text != null ? '${json.encode(text)}' : 'null'},"retweeted_status": $retweeted_status,"user": $user,"visible": $visible}';
  }
}

class MessageVisibleModel {
  int list_id;
  int type;

  MessageVisibleModel.fromParams({this.list_id, this.type});

  MessageVisibleModel.fromJson(jsonRes) {
    list_id = jsonRes['list_id'];
    type = jsonRes['type'];
  }

  @override
  String toString() {
    return '{"list_id": $list_id,"type": $type}';
  }
}

class MessageUserModel {
  int follow_count;
  int followers_count;
  int id;
  int mbrank;
  int mbtype;
  int statuses_count;
  int urank;
  int verified_type;
  int verified_type_ext;
  bool close_blue_v;
  bool follow_me;
  bool following;
  bool like;
  bool like_me;
  bool verified;
  String avatar_hd;
  String cover_image_phone;
  String description;
  String gender;
  String profile_image_url;
  String profile_url;
  String screen_name;
  String verified_reason;
  MessageBadageModel badge;

  MessageUserModel.fromParams(
      {this.follow_count,
      this.followers_count,
      this.id,
      this.mbrank,
      this.mbtype,
      this.statuses_count,
      this.urank,
      this.verified_type,
      this.verified_type_ext,
      this.close_blue_v,
      this.follow_me,
      this.following,
      this.like,
      this.like_me,
      this.verified,
      this.avatar_hd,
      this.cover_image_phone,
      this.description,
      this.gender,
      this.profile_image_url,
      this.profile_url,
      this.screen_name,
      this.verified_reason,
      this.badge});

  MessageUserModel.fromJson(jsonRes) {
    follow_count = jsonRes['follow_count'];
    followers_count = jsonRes['followers_count'];
    id = jsonRes['id'];
    mbrank = jsonRes['mbrank'];
    mbtype = jsonRes['mbtype'];
    statuses_count = jsonRes['statuses_count'];
    urank = jsonRes['urank'];
    verified_type = jsonRes['verified_type'];
    verified_type_ext = jsonRes['verified_type_ext'];
    close_blue_v = jsonRes['close_blue_v'];
    follow_me = jsonRes['follow_me'];
    following = jsonRes['following'];
    like = jsonRes['like'];
    like_me = jsonRes['like_me'];
    verified = jsonRes['verified'];
    avatar_hd = jsonRes['avatar_hd'];
    cover_image_phone = jsonRes['cover_image_phone'];
    description = jsonRes['description'];
    gender = jsonRes['gender'];
    profile_image_url = jsonRes['profile_image_url'];
    profile_url = jsonRes['profile_url'];
    screen_name = jsonRes['screen_name'];
    verified_reason = jsonRes['verified_reason'];
    badge = jsonRes['badge'] == null
        ? null
        : new MessageBadageModel.fromJson(jsonRes['badge']);
  }

  @override
  String toString() {
    return '{"follow_count": $follow_count,"followers_count": $followers_count,"id": $id,"mbrank": $mbrank,"mbtype": $mbtype,"statuses_count": $statuses_count,"urank": $urank,"verified_type": $verified_type,"verified_type_ext": $verified_type_ext,"close_blue_v": $close_blue_v,"follow_me": $follow_me,"following": $following,"like": $like,"like_me": $like_me,"verified": $verified,"avatar_hd": ${avatar_hd != null ? '${json.encode(avatar_hd)}' : 'null'},"cover_image_phone": ${cover_image_phone != null ? '${json.encode(cover_image_phone)}' : 'null'},"description": ${description != null ? '${json.encode(description)}' : 'null'},"gender": ${gender != null ? '${json.encode(gender)}' : 'null'},"profile_image_url": ${profile_image_url != null ? '${json.encode(profile_image_url)}' : 'null'},"profile_url": ${profile_url != null ? '${json.encode(profile_url)}' : 'null'},"screen_name": ${screen_name != null ? '${json.encode(screen_name)}' : 'null'},"verified_reason": ${verified_reason != null ? '${json.encode(verified_reason)}' : 'null'},"badge": $badge}';
  }
}

class MessageBadageModel {
  int double11_2018;
  int national_day_2018;
  int qixi_2018;
  int suishoupai_2018;
  int unread_pool;
  int unread_pool_ext;
  int user_name_certificate;
  int wenda_v2;
  int zongyiji;

  MessageBadageModel.fromParams(
      {this.double11_2018,
      this.national_day_2018,
      this.qixi_2018,
      this.suishoupai_2018,
      this.unread_pool,
      this.unread_pool_ext,
      this.user_name_certificate,
      this.wenda_v2,
      this.zongyiji});

  MessageBadageModel.fromJson(jsonRes) {
    double11_2018 = jsonRes['double11_2018'];
    national_day_2018 = jsonRes['national_day_2018'];
    qixi_2018 = jsonRes['qixi_2018'];
    suishoupai_2018 = jsonRes['suishoupai_2018'];
    unread_pool = jsonRes['unread_pool'];
    unread_pool_ext = jsonRes['unread_pool_ext'];
    user_name_certificate = jsonRes['user_name_certificate'];
    wenda_v2 = jsonRes['wenda_v2'];
    zongyiji = jsonRes['zongyiji'];
  }

  @override
  String toString() {
    return '{"double11_2018": $double11_2018,"national_day_2018": $national_day_2018,"qixi_2018": $qixi_2018,"suishoupai_2018": $suishoupai_2018,"unread_pool": $unread_pool,"unread_pool_ext": $unread_pool_ext,"user_name_certificate": $user_name_certificate,"wenda_v2": $wenda_v2,"zongyiji": $zongyiji}';
  }
}

class MessageReweetedStatusModel {
  int attitudes_count;
  int comments_count;
  int content_auth;
  int edit_count;
  int hide_flag;
  int mblog_vip_type;
  int mblogtype;
  int more_info_type;
  int pending_approval_count;
  int reposts_count;
  int retweeted;
  int reward_exhibition_type;
  int show_additional_indication;
  int show_attitude_bar;
  int status;
  int textLength;
  int weibo_position;
  bool can_edit;
  bool favorited;
  bool isLongText;
  bool is_paid;
  String bid;
  String bmiddle_pic;
  String cardid;
  String created_at;
  String edit_at;
  String id;
  String idstr;
  String mid;
  String original_pic;
  String picStatus;
  String source;
  String text;
  String thumbnail_pic;
  List<MessagePictureModel> pics;
  MessageUserModel user;
  MessageVisibleModel visible;

  MessageReweetedStatusModel.fromParams(
      {this.attitudes_count,
      this.comments_count,
      this.content_auth,
      this.edit_count,
      this.hide_flag,
      this.mblog_vip_type,
      this.mblogtype,
      this.more_info_type,
      this.pending_approval_count,
      this.reposts_count,
      this.retweeted,
      this.reward_exhibition_type,
      this.show_additional_indication,
      this.show_attitude_bar,
      this.status,
      this.textLength,
      this.weibo_position,
      this.can_edit,
      this.favorited,
      this.isLongText,
      this.is_paid,
      this.bid,
      this.bmiddle_pic,
      this.cardid,
      this.created_at,
      this.edit_at,
      this.id,
      this.idstr,
      this.mid,
      this.original_pic,
      this.picStatus,
      this.source,
      this.text,
      this.thumbnail_pic,
      this.pics,
      this.user,
      this.visible});

  MessageReweetedStatusModel.fromJson(jsonRes) {
    attitudes_count = jsonRes['attitudes_count'];
    comments_count = jsonRes['comments_count'];
    content_auth = jsonRes['content_auth'];
    edit_count = jsonRes['edit_count'];
    hide_flag = jsonRes['hide_flag'];
    mblog_vip_type = jsonRes['mblog_vip_type'];
    mblogtype = jsonRes['mblogtype'];
    more_info_type = jsonRes['more_info_type'];
    pending_approval_count = jsonRes['pending_approval_count'];
    reposts_count = jsonRes['reposts_count'];
    retweeted = jsonRes['retweeted'];
    reward_exhibition_type = jsonRes['reward_exhibition_type'];
    show_additional_indication = jsonRes['show_additional_indication'];
    show_attitude_bar = jsonRes['show_attitude_bar'];
    status = jsonRes['status'];
    textLength = jsonRes['textLength'];
    weibo_position = jsonRes['weibo_position'];
    can_edit = jsonRes['can_edit'];
    favorited = jsonRes['favorited'];
    isLongText = jsonRes['isLongText'];
    is_paid = jsonRes['is_paid'];
    bid = jsonRes['bid'];
    bmiddle_pic = jsonRes['bmiddle_pic'];
    cardid = jsonRes['cardid'];
    created_at = jsonRes['created_at'];
    edit_at = jsonRes['edit_at'];
    id = jsonRes['id'];
    idstr = jsonRes['idstr'];
    mid = jsonRes['mid'];
    original_pic = jsonRes['original_pic'];
    picStatus = jsonRes['picStatus'];
    source = jsonRes['source'];
    text = jsonRes['text'];

    text = text.replaceAll("<br />", "\n");

    thumbnail_pic = jsonRes['thumbnail_pic'];
    pics = jsonRes['pics'] == null ? null : [];

    for (var picsItem in pics == null ? [] : jsonRes['pics']) {
      pics.add(
          picsItem == null ? null : new MessagePictureModel.fromJson(picsItem));
    }

    user = jsonRes['user'] == null
        ? null
        : new MessageUserModel.fromJson(jsonRes['user']);
    visible = jsonRes['visible'] == null
        ? null
        : new MessageVisibleModel.fromJson(jsonRes['visible']);
  }

  @override
  String toString() {
    return '{"attitudes_count": $attitudes_count,"comments_count": $comments_count,"content_auth": $content_auth,"edit_count": $edit_count,"hide_flag": $hide_flag,"mblog_vip_type": $mblog_vip_type,"mblogtype": $mblogtype,"more_info_type": $more_info_type,"pending_approval_count": $pending_approval_count,"reposts_count": $reposts_count,"retweeted": $retweeted,"reward_exhibition_type": $reward_exhibition_type,"show_additional_indication": $show_additional_indication,"show_attitude_bar": $show_attitude_bar,"status": $status,"textLength": ${text != null ? '${json.encode(text)}' : 'null'}Length,"weibo_position": $weibo_position,"can_edit": $can_edit,"favorited": $favorited,"isLongText": $isLongText,"is_paid": $is_paid,"bid": ${bid != null ? '${json.encode(bid)}' : 'null'},"bmiddle_pic": ${bmiddle_pic != null ? '${json.encode(bmiddle_pic)}' : 'null'},"cardid": ${cardid != null ? '${json.encode(cardid)}' : 'null'},"created_at": ${created_at != null ? '${json.encode(created_at)}' : 'null'},"edit_at": ${edit_at != null ? '${json.encode(edit_at)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"idstr": ${idstr != null ? '${json.encode(idstr)}' : 'null'},"mid": ${mid != null ? '${json.encode(mid)}' : 'null'},"original_pic": ${original_pic != null ? '${json.encode(original_pic)}' : 'null'},"picStatus": ${picStatus != null ? '${json.encode(picStatus)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"text": ${text != null ? '${json.encode(text)}' : 'null'},"thumbnail_pic": ${thumbnail_pic != null ? '${json.encode(thumbnail_pic)}' : 'null'},"pics": $pics,"user": $user,"visible": $visible}';
  }
}

class MessageBadgeModel {
  int dzwbqlx_2016;
  int qixi_2018;
  int suishoupai_2018;
  int super_star_2018;
  int travel_2017;
  int unread_pool;
  int unread_pool_ext;
  int user_name_certificate;
  int worldcup_2018;

  MessageBadgeModel.fromParams(
      {this.dzwbqlx_2016,
      this.qixi_2018,
      this.suishoupai_2018,
      this.super_star_2018,
      this.travel_2017,
      this.unread_pool,
      this.unread_pool_ext,
      this.user_name_certificate,
      this.worldcup_2018});

  MessageBadgeModel.fromJson(jsonRes) {
    dzwbqlx_2016 = jsonRes['dzwbqlx_2016'];
    qixi_2018 = jsonRes['qixi_2018'];
    suishoupai_2018 = jsonRes['suishoupai_2018'];
    super_star_2018 = jsonRes['super_star_2018'];
    travel_2017 = jsonRes['travel_2017'];
    unread_pool = jsonRes['unread_pool'];
    unread_pool_ext = jsonRes['unread_pool_ext'];
    user_name_certificate = jsonRes[''];
    worldcup_2018 = jsonRes['worldcup_2018'];
  }

  @override
  String toString() {
    return '{"dzwbqlx_2016": $dzwbqlx_2016,"qixi_2018": $qixi_2018,"suishoupai_2018": $suishoupai_2018,"super_star_2018": $super_star_2018,"travel_2017": $travel_2017,"unread_pool": $unread_pool,"unread_pool_ext": $unread_pool_ext,"": $user_name_certificate,"worldcup_2018": $worldcup_2018}';
  }
}

class MessagePictureModel {
  String pid;
  String size;
  String url;
  MessageGeoModel geo;
  MessageLargeModel large;

  MessagePictureModel.fromParams(
      {this.pid, this.size, this.url, this.geo, this.large});

  MessagePictureModel.fromJson(jsonRes) {
    pid = jsonRes['pid'];
    size = jsonRes['size'];
    url = jsonRes['url'];
    geo = jsonRes['geo'] == null
        ? null
        : new MessageGeoModel.fromJson(jsonRes['geo']);
    large = jsonRes['large'] == null
        ? null
        : new MessageLargeModel.fromJson(jsonRes['large']);
  }

  @override
  String toString() {
    return '{"pid": ${pid != null ? '${json.encode(pid)}' : 'null'},"size": ${size != null ? '${json.encode(size)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"geo": $geo,"large": $large}';
  }
}

class MessageLargeModel {
  String size;
  String url;
  MessageGeoModel geo;

  MessageLargeModel.fromParams({this.size, this.url, this.geo});

  MessageLargeModel.fromJson(jsonRes) {
    size = jsonRes['size'];
    url = jsonRes['url'];
    // geo = jsonRes['geo'] == null ? null : new MessageGeoModel.fromJson(jsonRes['geo']);
  }

  @override
  String toString() {
    return '{"size": ${size != null ? '${json.encode(size)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"geo": $geo}';
  }
}

class MessageGeoModel {
  int height;
  int width;
  bool croped;

  MessageGeoModel.fromParams({this.height, this.width, this.croped});

  MessageGeoModel.fromJson(jsonRes) {
    height = jsonRes['height'];
    width = jsonRes['width'];
    croped = jsonRes['croped'];
  }

  @override
  String toString() {
    return '{"height": $height,"width": $width,"croped": $croped}';
  }
}

class MessageActionModel {
  int act_code;
  String ext;
  String fid;
  String luicode;
  String uicode;

  MessageActionModel.fromParams(
      {this.act_code, this.ext, this.fid, this.luicode, this.uicode});

  MessageActionModel.fromJson(jsonRes) {
    act_code = jsonRes['act_code'];
    ext = jsonRes['ext'];
    fid = jsonRes['fid'];
    luicode = jsonRes['luicode'];
    uicode = jsonRes['uicode'];
  }

  @override
  String toString() {
    return '{"act_code": $act_code,"ext": ${ext != null ? '${json.encode(ext)}' : 'null'},"fid": ${fid != null ? '${json.encode(fid)}' : 'null'},"luicode": ${luicode != null ? '${json.encode(luicode)}' : 'null'},"uicode": ${uicode != null ? '${json.encode(uicode)}' : 'null'}}';
  }
}
