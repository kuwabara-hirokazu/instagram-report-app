import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insight_media.freezed.dart';

// メディアのインサイト情報
@freezed
class InsightMedia with _$InsightMedia {
  const factory InsightMedia({
    // 投稿順番号
    required int postedOrder,

    // 投稿日
    required DateTime postedDate,

    // 投稿本文
    required String caption,

    // 投稿種類（Feed or Reel）
    required String mediaType,

    // 画像URL
    required String mediaUrl,

    // 投稿URL
    required String permalink,

    // いいね数
    required int likeCount,

    // コメント数
    required int commentsCount,

    // 保存数
    required int saveCount,

    // インプレッション数
    required int impression,

    // リーチ数
    required int reach,

    // 保存率
    required double saveRate,

    // フードジャンル
    required String foodType,
  }) = _InsightMedia;
}
