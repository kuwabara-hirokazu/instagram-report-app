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
                  const Text('保存数'),
                  Text(insight.saveCount.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('impression'),
                  Text(insight.impression.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('保存率'),
                  Text(insight.saveRate.toString()),
                ],
              ),
            ],
          ),
        ]));
  }
}
