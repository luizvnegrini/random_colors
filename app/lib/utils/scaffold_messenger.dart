import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/core/core.dart';

/// Provides a global key for the ScaffoldMessenger state.
final scaffoldMessenger =
    StateProvider((_) => GlobalKey<ScaffoldMessengerState>());

/// Retrieves the ScaffoldMessenger's global key from the provided WidgetRef.
///
/// [ref] The WidgetRef to watch for changes.
///
/// Returns a GlobalKey<ScaffoldMessengerState>.
GlobalKey<ScaffoldMessengerState> useScaffoldMessenger(WidgetRef ref) =>
    ref.watch(scaffoldMessenger);

/// Displays a SnackBar using the ScaffoldMessenger.
void showSnackBar(WidgetRef ref, SnackBar snackBar) =>
    ref.read(scaffoldMessenger).currentState?.showSnackBar(snackBar);

/// Displays a SnackBar for a given exception.
void showExceptionSnackBar(WidgetRef ref, BaseException exception) {
  final content = Text(_descriptionForException(exception));
  final exceptionSnackBar = SnackBar(content: content);
  showSnackBar(ref, exceptionSnackBar);
}

/// Displays a warning SnackBar with a given message.
void showWarnSnackBar(WidgetRef ref, String message) {
  final exceptionSnackBar = SnackBar(content: Text(message));
  showSnackBar(ref, exceptionSnackBar);
}

/// Returns a description string for a given exception type.
String _descriptionForException(BaseException exception) {
  switch (exception.type) {
    case ExceptionType.unexpected:
      return 'Try again later';
    default:
      throw UnimplementedError();
  }
}
