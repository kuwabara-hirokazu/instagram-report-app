import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_report_app/detail.dart';
import 'package:instagram_report_app/presentation/page/home.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(routes: $appRoutes);

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
    return const MyHomePage(title: 'Home');
  }
}

class DetailRoute extends GoRouteData {
  const DetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailsScreen();
  }
}
