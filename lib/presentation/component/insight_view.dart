import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:instagram_report_app/presentation/component/insight_item.dart';

import '../../domain/repository/insight_repository.dart';
import '../router.dart';
import 'async_value_handler.dart';

class InsightView extends ConsumerStatefulWidget {
  const InsightView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InsightViewState();
}

class _InsightViewState extends ConsumerState<InsightView> {
  @override
  Widget build(BuildContext context) {
    return AsyncValueHandler(
      value: ref.watch(insightReportsProvider),
      builder: ((insights) {
        return ListView.builder(
          itemCount: insights.length,
          itemBuilder: (context, index) {
            final insight = insights[index];
            // Todo: filter
            if (insight.mediaType == 'Reel') return const SizedBox();

            return InkWell(
              onTap: () => const DetailRoute().go(context),
              child: InsightItem(insight: insight),
            );
          },
        );
      }),
    );
  }
}
