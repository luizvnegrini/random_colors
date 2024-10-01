import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/presentation/home_page/home_page_providers.dart';
import 'package:random_colors/utils/utils.dart';

/// The HomePage widget represents the main screen of the application.
/// It extends HookConsumerWidget to utilize both hooks and Riverpod's Consumer
/// functionality.
class HomePage extends HookConsumerWidget {
  /// Constructs a HomePage widget.
  /// The [key] parameter is optional and can be used to provide a unique
  /// identifier for this widget.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget? loadingWidget;

    return HookConsumer(
      builder: (context, ref, __) {
        //final vm = readHomeViewModel(ref);
        final state = useHomeState(ref);

        if (state.errorMessage.isNotEmpty) {
          _handleError(
            context,
            ref,
            state.errorMessage,
          );
        }

        if (state.isLoading) {
          loadingWidget = const Center(child: CircularProgressIndicator());
        }

        return ScaffoldWidget(
          backgroundColor: Colors.white,
          body: loadingWidget ?? const Text('Unimplemented'),
        );
      },
    );
  }

  void _handleError(BuildContext context, WidgetRef ref, String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final scaffoldMessenger = useScaffoldMessenger(ref);
        scaffoldMessenger.currentState?.showSnackBar(
          SnackBar(
            backgroundColor: context.colors.unhealthy,
            padding: const EdgeInsets.symmetric(horizontal: kSpacingXXS),
            showCloseIcon: true,
            content: Text(message),
            duration: const Duration(seconds: 2), // Duração da Snackbar
          ),
        );
      },
    );
  }
}
