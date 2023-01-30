import 'package:flutter/material.dart';

enum InsightCategory {
  favorite('likeCount', 'いいね数', Icons.favorite_border),
  comment('commentsCount', 'コメント数', Icons.chat_bubble_outline),
  save('saved', '保存数', Icons.bookmark_border),
  plays('impression', '再生数', Icons.play_circle_outline),
  impression('impression', 'インプレッション数', Icons.visibility_outlined),
  reach('reach', 'リーチ数', Icons.perm_identity),
  saveRate('saveRate', '保存率', Icons.bookmark_added_outlined),
  ascending('postedOrder', '日付昇順', Icons.vertical_align_top),
  descending('postedOrder', '日付降順', Icons.vertical_align_bottom);

  const InsightCategory(this.fieldName, this.name, this.icon);

  final String fieldName;
  final String name;
  final IconData icon;
}
