import 'package:random_colors/domain/domain.dart';

/// Abstract class representing the dependencies of the application.
abstract class AppDependencies {
  /// Use case for generating a new color.
  abstract final GenerateNewColor generateNewColor;
}

/// Concrete implementation of [AppDependencies].
class AppDependenciesImpl implements AppDependencies {
  /// Use case for generating a new color.
  @override
  final GenerateNewColor generateNewColor;

  /// Creates a new instance of [AppDependenciesImpl].
  /// [generateNewColor] is required and represents the use case for generating
  ///  a new color.
  @override
  AppDependenciesImpl({
    required this.generateNewColor,
  });

  /// Asynchronously loads and initializes the application dependencies.
  /// Returns a [Future] that completes with an instance of [AppDependencies].
  static Future<AppDependencies> load() async {
    return AppDependenciesImpl(
      generateNewColor: GenerateNewColorImpl(),
    );
  }
}
