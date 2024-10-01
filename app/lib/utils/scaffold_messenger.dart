import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../core/core.dart';

final scaffoldMessenger =
    StateProvider((_) => GlobalKey<ScaffoldMessengerState>());

GlobalKey<ScaffoldMessengerState> useScaffoldMessenger(WidgetRef ref) =>
    ref.watch(scaffoldMessenger);

void showSnackBar(WidgetRef ref, SnackBar snackBar) =>
    ref.read(scaffoldMessenger).currentState?.showSnackBar(snackBar);

void showExceptionSnackBar(WidgetRef ref, BaseException exception) {
  final content = Text(_descriptionForException(exception));
  final exceptionSnackBar = SnackBar(content: content);
  showSnackBar(ref, exceptionSnackBar);
}

void showWarnSnackBar(WidgetRef ref, String message) {
  final exceptionSnackBar = SnackBar(content: Text(message));
  showSnackBar(ref, exceptionSnackBar);
}

String _descriptionForException(BaseException exception) {
  switch (exception.type) {
    case ExceptionType.serverError:
      return 'Try again later';
    case ExceptionType.notFound:
      return 'Not found';
    default:
      throw UnimplementedError();
  }
}
