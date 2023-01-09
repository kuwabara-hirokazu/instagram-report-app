import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repository/insight_repository.dart';

final insightServiceProvider = Provider(
  InsightService.new,
);

class InsightService {
  const InsightService(this.ref);

  final Ref ref;

  // 最初のページを取得する
  Future<void> fetchFirstPage() async {
    final repository = ref.watch(insightRepositoryProvider);
    final insights = await repository.fetchFirstInsight();
    repository.updateInsight(insights);
  }

  // 次のページを取得する
  Future<void> fetchNextPage() async {
    final repository = ref.watch(insightRepositoryProvider);
    final lastDoc = repository.getLastInsightDocument();
    final insights = await repository.fetchNextInsight(lastDoc);
    if (insights.isNotEmpty) {
      repository.updateInsight(insights);
    }
  }
}
