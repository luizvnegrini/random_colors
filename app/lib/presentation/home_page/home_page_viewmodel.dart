import 'package:external_dependencies/external_dependencies.dart';
import 'package:random_colors/data/usecases/generate_new_color.dart';
import 'package:random_colors/presentation/base/viewmodel.dart';
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
  Future<void> newColor();
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
  Future<void> newColor() async {
    // Set loading state
    state = state.copyWith(isLoading: true);

    // Simulate a delay (for demonstration purposes)
    await Future.delayed(const Duration(seconds: 1));

    // Generate a new color
    final result = generateNewColor();

    // Update state based on the result
    final newState = result.fold(
      (failure) => state.copyWith(errorMessage: failure.message),
      (color) => state.copyWith(color: color),
    );

    // Set final state (not loading, with updated color or error message)
    state = newState.copyWith(isLoading: false);
  }
}
