import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/domain/usecases/generate_new_color.dart';
import 'package:random_colors/presentation/base/base.dart';
import 'package:random_colors/presentation/home_page/home_page_state.dart';
import 'package:random_colors/presentation/presentation.dart';

/// Provides an instance of [HomePageViewModel] that automatically disposes
/// when no longer needed.
final homePageViewModel =
    StateNotifierProvider.autoDispose<HomePageViewModel, HomePageState>(
  (ref) => HomePageViewModelImpl(
    generateNewColor: ref.read(generateNewColor),
  ),
);

/// Abstract class defining the contract for the HomePage's ViewModel.
abstract class HomePageViewModel extends ViewModel<HomePageState> {
  /// Use case for generating a new color.
  abstract final GenerateNewColor generateNewColor;

  /// Constructor that takes an initial state.
  HomePageViewModel(super.state);

  /// Generates a new color and updates the state accordingly.
  void newColor();
}

/// Concrete implementation of [HomePageViewModel].
class HomePageViewModelImpl extends HomePageViewModel {
  /// Use case for generating a new color.
  @override
  final GenerateNewColor generateNewColor;

  /// Constructor that takes a [GenerateNewColor] use case and initializes
  /// the state.
  HomePageViewModelImpl({
    required this.generateNewColor,
  }) : super(HomePageStateImpl.initial());

  /// Generates a new color, updates the state, and handles any potential
  /// errors.
  @override
  void newColor() {
    final result = generateNewColor();

    state = result.fold(
      (failure) => state.copyWith(errorMessage: failure.message),
      (hex) => state.copyWith(hex: hex),
    );
  }
}
