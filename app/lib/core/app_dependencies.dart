import 'package:random_colors/data/data.dart';

abstract class AppDependencies {
  //usecases
  abstract final GenerateNewColor generateNewColor;
}

class AppDependenciesImpl implements AppDependencies {
  //usecases
  @override
  final GenerateNewColor generateNewColor;

  @override
  AppDependenciesImpl({
    required this.generateNewColor,
  });

  static Future<AppDependencies> load() async {
    return AppDependenciesImpl(
      generateNewColor: GenerateNewColorImpl(),
    );
  }
}
