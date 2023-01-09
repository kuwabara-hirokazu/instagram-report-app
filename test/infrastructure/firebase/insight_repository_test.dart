import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_report_app/domain/entity/insight_media.dart';
import 'package:instagram_report_app/domain/repository/insight_repository.dart';
import 'package:instagram_report_app/infrastructure/firebase/document/insight_media_document.dart';
import 'package:instagram_report_app/infrastructure/firebase/repository/insight_repository.dart';

const _pageLimit = 10;
const _mediaTypeFeed = 'Feed';
const _mediaTypeReel = 'Reel';
const _meatAndFish = '肉・寿司';
const _cafe = 'カフェ・デザート';
const _noodles = '麺・その他';

void main() {
  late InsightRepository subject;
  late CollectionReference<InsightMediaDocument> insightCollectionRef;

  final DateTime createdAt = DateTime(2023, 1, 1, 12, 12);

  // 毎回テストケースを実行するたびに最初に呼ばれる処理
  setUp(() {
    final firestore = FakeFirebaseFirestore();
    final container = ProviderContainer(
      overrides: [
        insightRepositoryProvider
            .overrideWithValue(InsightRepositoryImpl(firestore: firestore))
      ],
    );

    subject = container.read(insightRepositoryProvider);

    insightCollectionRef =
        firestore.collection('insight').withInsightMediaDocumentConverter();
  });

  // 初期読み込みテスト
  group('fetchFirstInsight', () {
    test('firestoreのデータが空のときは空で返ってくること', () async {
      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult, []);
    });
    test('firestoreにデータが1~$_pageLimit個のときは全て返ってくること', () async {
      const dataLength = 10;

      for (var index = 1; index <= dataLength; index++) {
        final data = _createInsightMediaDocument(
            postedOrder: index, timestamp: createdAt);
        insightCollectionRef.add(data);
      }

      final expectedResult = List.generate(
          dataLength,
          (index) =>
              _createInsightMedia(postedOrder: index, timestamp: createdAt));

      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult.length, expectedResult.length);
    });
    test('firestoreにデータが$_pageLimit個より多いときは$_pageLimit個だけ返ってくること', () async {
      const dataLength = _pageLimit + 1;

      for (var index = 1; index <= dataLength; index++) {
        final data = _createInsightMediaDocument(
            postedOrder: index, timestamp: createdAt);
        insightCollectionRef.add(data);
      }

      final expectedResult = List.generate(
          dataLength - 1,
          (index) =>
              _createInsightMedia(postedOrder: index, timestamp: createdAt));

      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult.length, expectedResult.length);
    });
    test('mediaTypeが正しく変換されること', () async {
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 1, timestamp: createdAt, mediaType: _mediaTypeFeed));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 2, timestamp: createdAt, mediaType: _mediaTypeReel));

      final expectedResult = [
        _createInsightMedia(
            postedOrder: 1, timestamp: createdAt, isReel: false),
        _createInsightMedia(postedOrder: 2, timestamp: createdAt, isReel: true),
      ].reversed;

      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult, expectedResult);
    });
    test('saveRateの小数点第三位以下が切り捨てられること', () async {
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 1, timestamp: createdAt, saveRate: 1.0));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 2, timestamp: createdAt, saveRate: 1.23));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 3, timestamp: createdAt, saveRate: 1.234));

      final expectedResult = [
        _createInsightMedia(
            postedOrder: 1, timestamp: createdAt, saveRate: 1.0),
        _createInsightMedia(
            postedOrder: 2, timestamp: createdAt, saveRate: 1.23),
        _createInsightMedia(
            postedOrder: 3, timestamp: createdAt, saveRate: 1.23),
      ].reversed;

      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult, expectedResult);
    });
    test('foodTypeが正しく変換されること', () async {
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 1, timestamp: createdAt, foodType: _meatAndFish));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 2, timestamp: createdAt, foodType: _cafe));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 3, timestamp: createdAt, foodType: _noodles));
      insightCollectionRef.add(_createInsightMediaDocument(
          postedOrder: 4, timestamp: createdAt, foodType: ''));

      final expectedResult = [
        _createInsightMedia(
            postedOrder: 1,
            timestamp: createdAt,
            foodType: FoodType.meatAndFish),
        _createInsightMedia(
            postedOrder: 2, timestamp: createdAt, foodType: FoodType.cafe),
        _createInsightMedia(
            postedOrder: 3, timestamp: createdAt, foodType: FoodType.noodles),
        _createInsightMedia(
            postedOrder: 4, timestamp: createdAt, foodType: FoodType.unknown),
      ].reversed;

      final actualResult = await subject.fetchFirstInsight(_pageLimit);
      expect(actualResult, expectedResult);
    });
  });

  // ページング読み込みテスト
  group('fetchNextInsight', () {
    test(
        'firestoreにデータが${_pageLimit + _pageLimit - 1}個あるときは${_pageLimit - 1}個だけ返ってくること',
        () async {
      const dataLength = _pageLimit + _pageLimit - 1;

      for (var index = 1; index <= dataLength; index++) {
        final data = _createInsightMediaDocument(
            postedOrder: index, timestamp: createdAt);
        insightCollectionRef.add(data);
      }

      final snapshot = await insightCollectionRef
          .orderBy(InsightMediaDocument.field.postedOrder, descending: true)
          .limit(_pageLimit)
          .get();
      final lastDoc = snapshot.docs.last;

      final actualResult = await subject.fetchNextInsight(lastDoc, _pageLimit);
      expect(actualResult.length, dataLength - _pageLimit);
    });
    test('firestoreにデータが${_pageLimit + _pageLimit}個あるときは$_pageLimit個だけ返ってくること',
        () async {
      const dataLength = _pageLimit + _pageLimit;

      for (var index = 1; index <= dataLength; index++) {
        final data = _createInsightMediaDocument(
            postedOrder: index, timestamp: createdAt);
        insightCollectionRef.add(data);
      }

      final snapshot = await insightCollectionRef
          .orderBy(InsightMediaDocument.field.postedOrder, descending: true)
          .limit(_pageLimit)
          .get();
      final lastDoc = snapshot.docs.last;

      final actualResult = await subject.fetchNextInsight(lastDoc, _pageLimit);
      expect(actualResult.length, _pageLimit);
    });
    test(
        'firestoreにデータが${_pageLimit + _pageLimit + 1}個あるときは$_pageLimit個だけ返ってくること',
        () async {
      const dataLength = _pageLimit + _pageLimit + 1;

      for (var index = 1; index <= dataLength; index++) {
        final data = _createInsightMediaDocument(
            postedOrder: index, timestamp: createdAt);
        insightCollectionRef.add(data);
      }

      final snapshot = await insightCollectionRef
          .orderBy(InsightMediaDocument.field.postedOrder, descending: true)
          .limit(_pageLimit)
          .get();
      final lastDoc = snapshot.docs.last;

      final actualResult = await subject.fetchNextInsight(lastDoc, _pageLimit);
      expect(actualResult.length, _pageLimit);
    });
  });
}

InsightMediaDocument _createInsightMediaDocument({
  required int postedOrder,
  required DateTime timestamp,
  String caption = '本文',
  String mediaType = _mediaTypeFeed,
  String mediaUrl = 'https',
  String permalink = 'https',
  int likeCount = 400,
  int commentsCount = 10,
  int saved = 100,
  int impression = 5500,
  int reach = 5000,
  double saveRate = 2.0,
  String foodType = _meatAndFish,
}) {
  return InsightMediaDocument(
      postedOrder: postedOrder,
      timestamp: timestamp,
      caption: caption,
      mediaType: mediaType,
      mediaUrl: mediaUrl,
      permalink: permalink,
      likeCount: likeCount,
      commentsCount: commentsCount,
      saved: saved,
      impression: impression,
      reach: reach,
      saveRate: saveRate,
      foodType: foodType);
}

InsightMedia _createInsightMedia({
  required int postedOrder,
  required DateTime timestamp,
  String caption = '本文',
  bool isReel = false,
  String mediaUrl = 'https',
  String permalink = 'https',
  int likeCount = 400,
  int commentsCount = 10,
  int saved = 100,
  int impression = 5500,
  int reach = 5000,
  double saveRate = 2.0,
  FoodType foodType = FoodType.meatAndFish,
}) {
  return InsightMedia(
      postedOrder: postedOrder,
      postedDate: timestamp,
      caption: caption,
      isReel: isReel,
      mediaUrl: mediaUrl,
      permalink: permalink,
      likeCount: likeCount,
      commentsCount: commentsCount,
      saveCount: saved,
      impression: impression,
      reach: reach,
      saveRate: saveRate,
      foodType: foodType);
}

extension _CollectionReferenceEx on CollectionReference<Map<String, dynamic>> {
  CollectionReference<InsightMediaDocument>
      withInsightMediaDocumentConverter() =>
          withConverter<InsightMediaDocument>(
            fromFirestore: (snapshot, options) {
              return InsightMediaDocument.fromJson(snapshot.data()!);
            },
            toFirestore: ((insightDoc, options) {
              return insightDoc.toJson();
            }),
          );
}
