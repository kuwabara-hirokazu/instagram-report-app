import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_report_app/presentation/page/insight_detail_page.dart';
import 'package:instagram_report_app/presentation/page/home_page.dart';

import '../domain/entity/insight_media.dart';

part 'router.g.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    // 初期表示するパス
    initialLocation: const HomeRoute().location,
    // ルート
    routes: $appRoutes,
  ),
);

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<InsightDetailRoute>(
      path: 'insight/:insightId',
    )
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class InsightDetailRoute extends GoRouteData {
  const InsightDetailRoute({
    required this.insightId,
    this.$extra,
  });

  final String insightId;
  final InsightMedia? $extra;

  factory InsightDetailRoute.fromInsight(InsightMedia insight) {
    return InsightDetailRoute(
      insightId: insight.postedOrder.toString(),
      $extra: insight,
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return InsightDetailPage(insight: $extra);
  }
}
