import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:instagram_report_app/presentation/component/insight_item.dart';

import '../../application/insight_state_notifier.dart';
import '../../domain/entity/insight_category.dart';
import '../router.dart';
import 'async_value_handler.dart';

class InsightView extends ConsumerStatefulWidget {
  const InsightView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InsightViewState();
}

class _InsightViewState extends ConsumerState<InsightView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    // 初期ページのデータを取得する
    ref
        .read(insightStateProvider.notifier)
        .fetchFirstPage(InsightCategory.descending);

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        // スクロールが最後に達した時、次のデータを取得する
        ref.read(insightStateProvider.notifier).fetchNextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncValueHandler(
      value: ref.watch(insightStateProvider),
      builder: ((state) {
        if (state.isFirstPage) {
          // 画面生成時、scrollControllerがattachするのを待つ必要があるため一瞬待つ
          Future.delayed(const Duration(milliseconds: 100), () {
            _scrollController.jumpTo(0.0);
          });
        }
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final insight = state.items[index];
            return InkWell(
              onTap: () => const DetailRoute().go(context),
              child: InsightItem(insight: insight),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
