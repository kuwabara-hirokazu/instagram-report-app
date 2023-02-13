import 'package:flutter/material.dart';

import '../../domain/entity/insight_media.dart';

class InsightDetailPage extends StatelessWidget {
  const InsightDetailPage({Key? key, this.insight}) : super(key: key);

  final InsightMedia? insight;

  @override
  Widget build(BuildContext context) {
    if (insight == null) return SizedBox();

    return Scaffold(
        appBar: AppBar(title: const Text('Details Screen')),
        body: Text(insight!.caption));
  }
}
