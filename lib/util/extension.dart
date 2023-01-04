import 'package:instagram_report_app/domain/entity/insight_media.dart';

import '../gen/assets.gen.dart';

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
