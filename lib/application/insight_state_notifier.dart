import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_report_app/application/state/insight_state.dart';
import 'package:instagram_report_app/util/logger.dart';

import '../domain/entity/insight_category.dart';
import '../domain/repository/insight_repository.dart';

final insightStateProvider = StateNotifierProvider.autoDispose<
        InsightStateNotifier, AsyncValue<InsightState>>(
    (ref) => InsightStateNotifier(
          insightRepository: ref.watch(insightRepositoryProvider),
        ));

class InsightStateNotifier extends StateNotifier<AsyncValue<InsightState>> {
  InsightStateNotifier({required this.insightRepository})
      : super(const AsyncValue.loading()); // 初期化時はLoading状態

  final InsightRepository insightRepository;

  static const pageLimit = 10;

  // 最初のページを取得する
  Future<void> fetchFirstPage(InsightCategory category) async {
    state = await AsyncValue.guard(() async {
      final insights =
          await insightRepository.fetchFirstInsight(category, pageLimit);

      final insightsCount = insights.length;
      final result = InsightState(
        items: insights,
        totalCount: insightsCount,
        hasNext: insightsCount == pageLimit,
      );

      logger.i(
        'InsightState: '
        'totalCount = ${result.totalCount}, '
        'hasNext = ${result.hasNext}',
      );

      return result;
    });
  }

  // 次のページを取得する
  Future<void> fetchNextPage(InsightCategory category) async {
    final currentState = state.value;
    if (currentState == null) return;

    if (!currentState.hasNext) return;

    state = await AsyncValue.guard(() async {
      final lastDoc = insightRepository.getLastInsightDocument();
      final insights = await insightRepository.fetchNextInsight(
          lastDoc, category, pageLimit);

      final items = currentState.items + insights;
      final result = InsightState(
        items: items,
        totalCount: items.length,
        hasNext: insights.length == pageLimit,
      );

      logger.i(
        'InsightState: '
        'totalCount = ${result.totalCount}, '
        'hasNext = ${result.hasNext}',
      );

      return result;
    });
  }
}
