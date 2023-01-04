import 'package:flutter/material.dart';
import 'package:instagram_report_app/domain/entity/insight_media.dart';
import 'package:instagram_report_app/util/extension.dart';

import '../../gen/assets.gen.dart';

class InsightItem extends StatelessWidget {
  const InsightItem({super.key, required this.insight});

  final InsightMedia insight;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(width: 88, child: Image.network(insight.mediaUrl)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.likeCount.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.commentsCount.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.saveCount.toString()),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.visibility_outlined,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.impression.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.perm_identity,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.reach.toString()),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_added_outlined,
                    size: 24.0,
                  ),
                  const SizedBox(width: 4),
                  Text(
                      '${insight.saveRate.toString().substring(0, 4)}%'), // 稀に小数第三位以下が返ってくるため。
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  child: Text(
                    insight.postedOrder.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              insight.foodType.toAssetGenImage()?.image(height: 32) ??
                  const SizedBox(height: 32),
            ],
          )
        ]));
  }
}