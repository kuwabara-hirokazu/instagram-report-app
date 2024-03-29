import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entity/insight_category.dart';
import '../../../domain/entity/insight_media.dart';
import '../../../domain/repository/insight_repository.dart';
import '../document/insight_media_document.dart';

class InsightRepositoryImpl implements InsightRepository {
  InsightRepositoryImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  DocumentSnapshot? _lastDoc;

  static const insightCollectionName = 'insight';
  static const insightMediaDocumentFieldMediaType = 'mediaType';
  static const mediaTypeFeed = 'Feed';
  static const mediaTypeReel = 'Reel';

  @override
  Future<List<InsightMedia>> fetchFirstInsight(
    InsightCategory sortCategory,
    int pageLimit,
  ) async {
    final query = sortQuery(sortCategory).limit(pageLimit);
    final snapshot = await query.get();

    if (snapshot.docs.isEmpty) return [];

    // 最後のDocをキャッシュしておく
    _lastDoc = snapshot.docs.last;

    return snapshot.toInsightMediaList();
  }

  @override
  DocumentSnapshot getLastInsightDocument() {
    if (_lastDoc == null) {
      throw NullThrownError();
    } else {
      return _lastDoc!;
    }
  }

  @override
  Future<List<InsightMedia>> fetchNextInsight(
    DocumentSnapshot lastDoc,
    InsightCategory sortCategory,
    int pageLimit,
  ) async {
    final query =
        sortQuery(sortCategory).startAfterDocument(lastDoc).limit(pageLimit);
    final snapshot = await query.get();

    if (snapshot.docs.isEmpty) return [];

    // 最後のDocを更新
    _lastDoc = snapshot.docs.last;

    return snapshot.toInsightMediaList();
  }

  Query<InsightMediaDocument> sortQuery(
    InsightCategory sortCategory,
  ) {
    final docRef = firestore
        .collection(insightCollectionName)
        .withInsightMediaDocumentConverter();

    if (sortCategory == InsightCategory.impression) {
      // Feedでフィルター
      return docRef
          .where(insightMediaDocumentFieldMediaType, isEqualTo: mediaTypeFeed)
          .orderBy(sortCategory.fieldName, descending: true);
    }

    if (sortCategory == InsightCategory.plays) {
      // Reelでフィルター
      return docRef
          .where(insightMediaDocumentFieldMediaType, isEqualTo: mediaTypeReel)
          .orderBy(sortCategory.fieldName, descending: true);
    }

    return docRef.orderBy(sortCategory.fieldName,
        descending: (sortCategory != InsightCategory.ascending));
  }
}

extension _CollectionReferenceEx on CollectionReference<Map<String, dynamic>> {
  /// InsightMediaDocumentへ変換するWithConverter
  CollectionReference<InsightMediaDocument>
      withInsightMediaDocumentConverter() =>
          withConverter<InsightMediaDocument>(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data();
              return InsightMediaDocument.fromJson(json!);
            },
            toFirestore: (_, __) {
              // 更新することは無いため空実装
              return <String, dynamic>{};
            },
          );
}

extension _QuerySnapshotEx on QuerySnapshot<InsightMediaDocument> {
  List<InsightMedia> toInsightMediaList() =>
      docs.map((doc) => doc.data().toInsightMedia()).toList();
}

extension _InsightMediaDocumentEx on InsightMediaDocument {
  InsightMedia toInsightMedia() {
    final saveRateSt = saveRate.toString();
    // 稀に小数第三位以下まで返ってくるため整形する。
    final rate =
        saveRateSt.length > 4 ? saveRateSt.substring(0, 4) : saveRateSt;

    return InsightMedia(
      postedOrder: postedOrder,
      postedDate: timestamp,
      caption: caption,
      isReel: mediaType == 'Reel',
      mediaUrl: mediaUrl,
      permalink: permalink,
      likeCount: likeCount,
      commentsCount: commentsCount,
      saveCount: saved,
      impression: impression,
      reach: reach,
      saveRate: double.parse(rate),
      foodType: FoodType.fromFood(foodType),
    );
  }
}
