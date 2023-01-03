// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_media_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InsightMediaDocument _$$_InsightMediaDocumentFromJson(
        Map<String, dynamic> json) =>
    _$_InsightMediaDocument(
      postedOrder: json['postedOrder'] as int,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Object),
      caption: json['caption'] as String,
      mediaType: json['mediaType'] as String,
      mediaUrl: json['mediaUrl'] as String,
      permalink: json['permalink'] as String,
      likeCount: json['likeCount'] as int,
      commentsCount: json['commentsCount'] as int,
      saved: json['saved'] as int,
      impression: json['impression'] as int,
      reach: json['reach'] as int,
      saveRate: (json['saveRate'] as num).toDouble(),
      foodType: json['foodType'] as String,
    );

Map<String, dynamic> _$$_InsightMediaDocumentToJson(
        _$_InsightMediaDocument instance) =>
    <String, dynamic>{
      'postedOrder': instance.postedOrder,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'caption': instance.caption,
      'mediaType': instance.mediaType,
      'mediaUrl': instance.mediaUrl,
      'permalink': instance.permalink,
      'likeCount': instance.likeCount,
      'commentsCount': instance.commentsCount,
      'saved': instance.saved,
      'impression': instance.impression,
      'reach': instance.reach,
      'saveRate': instance.saveRate,
      'foodType': instance.foodType,
    };
