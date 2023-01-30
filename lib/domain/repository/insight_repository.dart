import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/insight_category.dart';
import '../entity/insight_media.dart';

final insightRepositoryProvider = Provider<InsightRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

abstract class InsightRepository {
  Future<List<InsightMedia>> fetchFirstInsight(
    InsightCategory category,
    int pageLimit,
  );
  Future<List<InsightMedia>> fetchNextInsight(
    DocumentSnapshot lastDoc,
    InsightCategory category,
    int pageLimit,
  );
  DocumentSnapshot getLastInsightDocument();
}
