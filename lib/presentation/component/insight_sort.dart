import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/insight_category.dart';

class InsightSortButton extends StatelessWidget {
  const InsightSortButton({
    super.key,
    this.padding = const EdgeInsets.only(right: 8.0),
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => const InsightSortBottomSheet(),
          );
        },
        icon: const Icon(
          Icons.sort,
          size: 28.0,
        ),
      ),
    );
  }
}

/// sortボタン押下時に画面下部に表示されるモーダル画面
class InsightSortBottomSheet extends ConsumerWidget {
  const InsightSortBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: InsightCategory.values.length,
      itemBuilder: (BuildContext context, int index) {
        final category = InsightCategory.values[index];
        return ListTile(
          leading: Icon(category.icon),
          title: Text(category.name),
          onTap: () => {},
        );
      },
    );
  }
}
