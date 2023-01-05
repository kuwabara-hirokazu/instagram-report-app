import 'package:flutter/material.dart';
import '../component/insight_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ホーム'),
        ),
        body: const InsightView());
  }
}
