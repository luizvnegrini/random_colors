import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/core/module/app_module.dart';

/// Defines the main router for the application.
/// This router uses [GoRouter] for navigation and routing.
/// It includes all routes defined in [AppModule.routes].
final GoRouter router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  routes: <RouteBase>[
    ...AppModule.routes,
  ],
);
