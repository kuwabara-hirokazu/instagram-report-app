import 'package:flutter/material.dart';
import 'package:instagram_report_app/presentation/component/insight_sort.dart';
import '../component/insight_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: const [
          InsightSortButton(),
        ],
      ),
      body: const InsightView(),
    );
  }
}
