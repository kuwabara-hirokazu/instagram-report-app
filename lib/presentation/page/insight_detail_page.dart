import 'package:flutter/material.dart';

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
          child: Text(insight!.caption),
        ),
      ),
    );
  }
}
