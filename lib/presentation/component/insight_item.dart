import 'package:flutter/material.dart';
import 'package:instagram_report_app/domain/entity/insight_media.dart';
import 'package:instagram_report_app/gen/assets.gen.dart';
import 'package:instagram_report_app/util/extension.dart';
import '../../domain/entity/insight_category.dart';
import 'media_thumbnail.dart';

class InsightItem extends StatelessWidget {
  const InsightItem({super.key, required this.insight});

  final InsightMedia insight;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              height: 112,
              width: 100,
              child: insight.isReel
                  ? Assets.images.reel.image()
                  : MediaThumbnail(
                      imageUrl: insight.mediaUrl,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                    )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    InsightCategory.favorite.icon,
                    size: 28.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.likeCount.toFormatThousandSeparator()),
                ],
              ),
              Row(
                children: [
                  Icon(
                    InsightCategory.comment.icon,
                    size: 28.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.commentsCount.toFormatThousandSeparator()),
                ],
              ),
              Row(
                children: [
                  Icon(
                    InsightCategory.save.icon,
                    size: 28.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.saveCount.toFormatThousandSeparator()),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  insight.isReel
                      ? Icon(
                          InsightCategory.plays.icon,
                          size: 28.0,
                        )
                      : Icon(
                          InsightCategory.impression.icon,
                          size: 28.0,
                        ),
                  const SizedBox(width: 4),
                  Text(insight.impression.toFormatThousandSeparator()),
                ],
              ),
              Row(
                children: [
                  Icon(
                    InsightCategory.reach.icon,
                    size: 28.0,
                  ),
                  const SizedBox(width: 4),
                  Text(insight.reach.toFormatThousandSeparator()),
                ],
              ),
              Row(
                children: [
                  Icon(
                    InsightCategory.saveRate.icon,
                    size: 28.0,
                  ),
                  const SizedBox(width: 4),
                  Text('${insight.saveRate}%'),
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
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.background,
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
