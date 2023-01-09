import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_report_app/util/logger.dart';

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

  @override
  Future<List<InsightMedia>> fetchFirstInsight(int pageLimit) async {
    final query = firestore
        .collection(insightCollectionName)
        .withInsightMediaDocumentConverter()
        .orderBy(InsightMediaDocument.field.postedOrder, descending: true)
        .limit(pageLimit);
    final snapshot = await query.get();

    if (snapshot.docs.isEmpty) return [];

    // 最後のDocをキャッシュしておく
    _lastDoc = snapshot.docs.last;

    final insightMediaList = snapshot.toInsightMediaList();
    logger.i('media取得数: ${insightMediaList.length}');

    return insightMediaList;
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
      DocumentSnapshot lastDoc, int pageLimit) async {
    final query = firestore
        .collection(insightCollectionName)
        .withInsightMediaDocumentConverter()
        .orderBy(InsightMediaDocument.field.postedOrder, descending: true)
        .startAfterDocument(lastDoc)
        .limit(pageLimit);
    final snapshot = await query.get();

    if (snapshot.docs.isEmpty) return [];

    // 最後のDocを更新
    _lastDoc = snapshot.docs.last;

    final insightMediaList = snapshot.toInsightMediaList();
    logger.i('media取得数: ${insightMediaList.length}');

    return insightMediaList;
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
