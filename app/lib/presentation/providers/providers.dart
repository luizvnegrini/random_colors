import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/data/usecases/generate_new_color.dart';

final generateNewColor = Provider.autoDispose<GenerateNewColor>((_) {
  throw UnimplementedError('generateNewColor usecase must be overridden');
});
