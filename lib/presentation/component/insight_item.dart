import 'package:flutter/material.dart';
import 'package:instagram_report_app/domain/entity/insight_media.dart';

class InsightItem extends StatelessWidget {
  const InsightItem({super.key, required this.insight});

  final InsightMedia insight;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        child: Row(children: [
          SizedBox(height: 120, child: Image.network(insight.mediaUrl)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('いいね'),
                  const SizedBox(width: 4),
                  Text(insight.likeCount.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('コメント'),
                  const SizedBox(width: 4),
                  Text(insight.commentsCount.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('保存'),
                  const SizedBox(width: 4),
                  Text(insight.saveCount.toString()),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('impression'),
                  const SizedBox(width: 4),
                  Text(insight.impression.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('reach'),
                  const SizedBox(width: 4),
                  Text(insight.reach.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('保存率'),
                  const SizedBox(width: 4),
                  Text(insight.saveRate
                      .toString()
                      .substring(0, 4)), // 稀に小数第三位以下が返ってくるため。
                ],
              ),
              Text(insight.foodType),
            ],
          ),
        ]));
  }
}
