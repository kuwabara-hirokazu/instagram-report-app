import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_report_app/domain/repository/insight_repository.dart';
import 'package:instagram_report_app/presentation/component/async_value_handler.dart';
import 'package:instagram_report_app/presentation/router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: AsyncValueHandler(
          value: ref.watch(insightReportsProvider),
          builder: ((p0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Home',
                  ),
                  ElevatedButton(
                      onPressed: () => const DetailRoute().go(context),
                      child: const Text('遷移'))
                ],
              ),
            );
          }),
        ));
  }
}
