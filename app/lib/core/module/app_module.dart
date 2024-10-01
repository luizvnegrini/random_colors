import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/presentation/presentation.dart';

/// Defines the routes used in the application.
// ignore: prefer_match_file_name
class Routes {
  /// The root path of the application.
  static String get _source => '/';

  /// The path for the home page.
  static String get home => _source;
}

/// Manages the application's routing configuration.
class AppModule {
  /// Returns a list of [GoRoute] objects defining the app's routes.
  /// Currently includes:
  /// - A route for the home page
  static List<GoRoute> get routes => [
        GoRoute(
          name: 'home',
          path: Routes.home,
          builder: (_, __) => const HomePage(),
        ),
      ];
}
