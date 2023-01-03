import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_report_app/infrastructure/firebase/converter.dart';

part 'insight_media_document.freezed.dart';
part 'insight_media_document.g.dart';

@freezed
class InsightMediaDocument with _$InsightMediaDocument {
  const factory InsightMediaDocument({
    required int postedOrder,
    @TimestampConverter() required DateTime timestamp,
    required String id,
    required String caption,
    required String title,
    required String mediaType,
    required String mediaUrl,
    required String permalink,
    required int likeCount,
    required int commentsCount,
    required int saved,
    required int impression,
    required int reach,
    required double saveRate,
    required String foodType,
  }) = _InsightMediaDocument;

  factory InsightMediaDocument.fromJson(Map<String, dynamic> json) =>
      _$InsightMediaDocumentFromJson(json);
}
