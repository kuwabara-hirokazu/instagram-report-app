import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_report_app/presentation/page/detail.dart';
import 'package:instagram_report_app/presentation/page/home.dart';

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
    TypedGoRoute<DetailRoute>(
      path: 'detail',
    )
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage(title: 'Home');
  }
}

class DetailRoute extends GoRouteData {
  const DetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailsScreen();
  }
}
