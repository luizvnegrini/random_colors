import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/data/usecases/generate_new_color.dart';
import 'package:random_colors/presentation/base/viewmodel.dart';
import 'package:random_colors/presentation/home_page/home_page_state.dart';
import 'package:random_colors/presentation/presentation.dart';

final homePageViewModel =
    StateNotifierProvider.autoDispose<HomePageViewModel, HomePageState>(
  (ref) => HomePageViewModelImpl(
    generateNewColor: ref.read(generateNewColor),
  ),
);

abstract class HomePageViewModel extends ViewModel<HomePageState> {
  HomePageViewModel(super.state);

  abstract final GenerateNewColor generateNewColor;

  Future<void> newColor();
}

class HomePageViewModelImpl extends HomePageViewModel {
  @override
  final GenerateNewColor generateNewColor;

  HomePageViewModelImpl({
    required this.generateNewColor,
  }) : super(HomePageStateImpl.initial());

  @override
  Future<void> newColor() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1));
    final result = generateNewColor();

    final newState = result.fold(
      (failure) => state.copyWith(errorMessage: failure.message),
      (color) => state.copyWith(color: color),
    );

    state = newState.copyWith(isLoading: false);
  }
}
