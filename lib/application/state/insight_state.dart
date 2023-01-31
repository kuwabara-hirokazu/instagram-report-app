import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_report_app/domain/entity/insight_media.dart';

import '../../domain/entity/insight_category.dart';

part 'insight_state.freezed.dart';

// メディアのインサイト情報
@freezed
class InsightState with _$InsightState {
  const factory InsightState({
    @Default(<InsightMedia>[]) List<InsightMedia> items,
    @Default(0) int totalCount,
    @Default(false) bool hasNext,
    @Default(false) bool isFirstPage,
    @Default(InsightCategory.descending) InsightCategory sortCategory,
  }) = _InsightState;
}
