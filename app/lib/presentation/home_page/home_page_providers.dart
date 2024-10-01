//vm's

import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/presentation/home_page/home_page_state.dart';
import 'package:random_colors/presentation/home_page/home_page_viewmodel.dart';

//vm's
HomePageViewModel readHomeViewModel(WidgetRef ref) =>
    ref.read(homePageViewModel.notifier);

//states
HomePageState useHomeState(WidgetRef ref) => ref.watch(homePageViewModel);
