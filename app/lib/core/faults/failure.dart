import 'package:random_colors/core/core.dart';

/// Represents a failure in the application.
/// This class extends [BaseException] and is used to encapsulate
/// failures that occur during the execution of the application.
class Failure extends BaseException {
  /// Creates a new [Failure] instance.
  /// [type] is a required parameter that specifies the type of the failure.
  /// It is passed to the superclass constructor.
  Failure({required super.type});
}
