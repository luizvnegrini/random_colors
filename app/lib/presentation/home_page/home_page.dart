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
        final vm = readHomeViewModel(ref);
        final state = useHomeState(ref);
        final color = state.hex?.toColor ?? Colors.white;

        if (state.errorMessage.isNotEmpty) {
          _handleError(
            context,
            ref,
            state.errorMessage,
          );
        }

        loadingWidget = state.isLoading
            ? ScaffoldWidget(
                showAppBar: false,
                backgroundColor: color,
                body: const Center(child: CircularProgressIndicator()),
              )
            : null;

        return loadingWidget ??
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: vm.newColor,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                color: color,
                child: ScaffoldWidget(
                  showAppBar: false,
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Text(
                      'Tap to change color',
                      style: TextStyle(
                        // Determines the text color based on the background
                        // color's luminance
                        // If the background is light (luminance > 0.5), use
                        // black text
                        // Otherwise, use white text for better contrast
                        color: color.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
