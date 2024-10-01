import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/app_state.dart';
import 'package:random_colors/app_viewmodel.dart';
import 'package:random_colors/core/core.dart';
import 'package:random_colors/presentation/presentation.dart';
import 'package:random_colors/utils/utils.dart';

// ignore: prefer_match_file_name
class Startup {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    final vm = AppViewModel();
    await vm.loadDependencies();

    runApp(_App(viewModel: vm));
    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is Trace) return stack.vmTrace;
      if (stack is Chain) return stack.toTrace().vmTrace;

      return stack;
    };
  }
}

class _App extends StatelessWidget {
  final AppViewModel viewModel;
  String get appTitle => 'My current weather';

  const _App({required this.viewModel});

  @override
  Widget build(BuildContext context) =>
      ValueListenableBuilder<AsyncValue<AppState>>(
        valueListenable: viewModel,
        builder: (_, value, __) => value.maybeWhen(
          data: _loadAppFlow,
          orElse: _loadSplashscreen,
        ),
      );

  ProviderScope _loadAppFlow(AppState state) {
    return ProviderScope(
      overrides: [
        generateNewColor.overrideWithValue(
          state.appDependencies.generateNewColor,
        ),
      ],
      child: AppLoadedRoot(appTitle: appTitle),
    );
  }

  Widget _loadSplashscreen() {
    return MaterialApp(
      title: appTitle,
      home: const SplashScreenPage(),
    );
  }
}

class AppLoadedRoot extends HookConsumerWidget {
  const AppLoadedRoot({required this.appTitle, super.key});

  final String appTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: useScaffoldMessenger(ref),
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
