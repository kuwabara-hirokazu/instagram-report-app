import 'package:instagram_report_app/domain/entity/insight_media.dart';
import 'package:intl/intl.dart';

import '../gen/assets.gen.dart';

// 3桁ごとのカンマ区切りフォーマット
extension CountFormat on int {
  String toFormatThousandSeparator() {
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}

// フードジャンルに合ったアイコンを返す
extension FoodTypeEx on FoodType {
  AssetGenImage? toAssetGenImage() {
    switch (this) {
      case FoodType.meatAndFish:
        return Assets.images.meat;
      case FoodType.cafe:
        return Assets.images.cafe;
      case FoodType.noodles:
        return Assets.images.noodles;
      case FoodType.unknown:
        return null;
    }
  }
}
