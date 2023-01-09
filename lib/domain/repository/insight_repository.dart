import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/insight_media.dart';

// インサイト集計結果を返すProvider
final currentInsightReportsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(insightRepositoryProvider).changesInsight();
});

final insightRepositoryProvider = Provider<InsightRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

abstract class InsightRepository {
  Future<List<InsightMedia>> fetchFirstInsight();
  Future<List<InsightMedia>> fetchNextInsight(DocumentSnapshot lastDoc);
  Future<void> updateInsight(List<InsightMedia> insights);
  DocumentSnapshot getLastInsightDocument();
  Stream<List<InsightMedia>> changesInsight();
}
