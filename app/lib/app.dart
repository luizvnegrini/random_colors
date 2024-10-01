import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/app_state.dart';
import 'package:random_colors/app_viewmodel.dart';
import 'package:random_colors/core/core.dart';
import 'package:random_colors/presentation/presentation.dart';
import 'package:random_colors/utils/utils.dart';

/// A utility class to initialize and run the application.
// ignore: prefer_match_file_name
class Startup {
  /// Initializes the Flutter binding, sets up the app view model,
  /// runs the app, and configures error handling.
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();

    final vm = AppViewModel();
    vm.loadDependencies();

    runApp(_App(viewModel: vm));
    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is Trace) return stack.vmTrace;
      if (stack is Chain) return stack.toTrace().vmTrace;

      return stack;
    };
  }
}

/// The root widget of the application.
class _App extends StatelessWidget {
  /// The view model for the app.
  final AppViewModel viewModel;

  /// The title of the app.
  String get appTitle => 'Random Colors';

  /// Creates an instance of _App.
  ///
  /// [viewModel] is required.
  const _App({required this.viewModel});

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<AsyncValue<AppState>>(
        valueListenable: viewModel,
        builder: (_, value, __) => value.maybeWhen(
          data: (state) => ProviderScope(
            overrides: [
              generateNewColor.overrideWithValue(
                state.appDependencies.generateNewColor,
              ),
            ],
            child: AppLoadedRoot(appTitle: appTitle),
          ),
          orElse: () => _SplashScreen(appTitle: appTitle),
        ),
      );
}

/// A widget that displays the splash screen.
class _SplashScreen extends StatelessWidget {
  /// Creates an instance of _SplashScreen.
  ///
  /// [appTitle] is required.
  const _SplashScreen({
    required this.appTitle,
  });

  /// The title of the app.
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const SplashScreenPage(),
    );
  }
}

/// The root widget for the loaded app state.
class AppLoadedRoot extends HookConsumerWidget {
  /// Creates an instance of AppLoadedRoot.
  ///
  /// [appTitle] is required.
  const AppLoadedRoot({required this.appTitle, super.key});

  /// The title of the app.
  final String appTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: useScaffoldMessenger(ref),
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
