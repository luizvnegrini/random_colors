/// This file contains providers for the HomePage.

import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/presentation/home_page/home_page_state.dart';
import 'package:random_colors/presentation/home_page/home_page_viewmodel.dart';

/// ViewModels

/// Reads the HomePageViewModel from the WidgetRef.
/// @param ref The WidgetRef to read from.
/// @return The HomePageViewModel instance.
HomePageViewModel readHomeViewModel(WidgetRef ref) =>
    ref.read(homePageViewModel.notifier);

/// Watches the HomePageState from the WidgetRef.
/// @param ref The WidgetRef to watch.
/// @return The current HomePageState.
HomePageState useHomeState(WidgetRef ref) => ref.watch(homePageViewModel);
