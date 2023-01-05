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

    // フィード or リール
    required bool isReel,

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
    required String saveRate,

    // フードジャンル
    required FoodType foodType,
  }) = _InsightMedia;
}

enum FoodType {
  meatAndFish,
  cafe,
  noodles,
  unknown;

  factory FoodType.fromFood(String food) {
    switch (food) {
      case '肉・寿司':
        return FoodType.meatAndFish;
      case 'カフェ・デザート':
        return FoodType.cafe;
      case '麺・その他':
        return FoodType.noodles;
    }
    return FoodType.unknown;
  }
}
