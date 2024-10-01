import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/core/core.dart';

abstract class GenerateNewColor {
  Either<Failure, String> call();
}

class GenerateNewColorImpl implements GenerateNewColor {
  @override
  Either<Failure, String> call() {
    throw UnimplementedError();
  }
}
