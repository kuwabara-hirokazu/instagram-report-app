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

  @override
  Future<List<InsightMedia>> getInsightReports() async {
    final query =
        firestore.collection('insight').withInsightMediaDocumentConverter();
    final snapshot = await query.get();
    final insightMedia = snapshot.toInsightMediaList();
    return insightMedia;
  }
}

extension _CollectionRefferenceEx on CollectionReference<Map<String, dynamic>> {
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
    return InsightMedia(
      postedOrder: postedOrder,
      postedDate: timestamp,
      caption: caption,
      mediaType: mediaType,
      mediaUrl: mediaUrl,
      permalink: permalink,
      likeCount: likeCount,
      commentsCount: commentsCount,
      saveCount: saved,
      impression: impression,
      reach: reach,
      saveRate: saveRate,
      foodType: foodType,
    );
  }
}
