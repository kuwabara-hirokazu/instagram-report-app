import 'package:flutter_riverpod/flutter_riverpod.dart';

final insightReportsProvider = FutureProvider((ref) async {
  final repository = ref.watch(insightRepositoryProvider);
  return repository.getInsightReports();
});

final insightRepositoryProvider = Provider<InsightRepository>(
  (_) => throw UnimplementedError('Provider was not initialized'),
);

abstract class InsightRepository {
  Future<void> getInsightReports();
}
