import 'package:flutter/material.dart';
import 'package:instagram_report_app/util/extension.dart';
import 'package:instagram_report_app/util/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entity/insight_media.dart';

class InsightDetailPage extends StatelessWidget {
  const InsightDetailPage({Key? key, this.insight}) : super(key: key);

  final InsightMedia? insight;

  @override
  Widget build(BuildContext context) {
    if (insight == null) return const SizedBox();

    return Scaffold(
      appBar: AppBar(title: Text('投稿No.${insight!.postedOrder}')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '[投稿日]',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(insight!.postedDate.toFormatString()),
              const SizedBox(height: 16),
              const Text(
                '[本文]',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(insight!.caption),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          try {
            await launchUrl(Uri.parse(insight!.permalink));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('このURLは開けませんでした'),
              ),
            );
            logger.e(e);
          }
        }),
        child: const Icon(Icons.open_in_new),
      ),
    );
  }
}
