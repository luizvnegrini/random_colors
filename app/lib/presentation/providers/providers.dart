import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/domain/domain.dart';

/// Provider for the GenerateNewColor use case.
/// This provider is auto-disposed when no longer needed.
final generateNewColor = Provider.autoDispose<GenerateNewColor>((_) {
  throw UnimplementedError('generateNewColor usecase must be overridden');
});
