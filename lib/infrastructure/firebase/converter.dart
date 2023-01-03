import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Object> {
  const TimestampConverter();

  @override
  DateTime fromJson(Object json) {
    return (json as Timestamp).toDate();
  }

  @override
  Object toJson(DateTime object) {
    // こちらから更新することは無いため不要。
    throw UnimplementedError();
  }
}
