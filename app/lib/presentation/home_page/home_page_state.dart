import 'package:random_colors/presentation/base/viewmodel.dart';

/// Abstract class representing the state of the HomePage.
/// Extends [ViewModelState] to provide state management functionality.
abstract class HomePageState extends ViewModelState {
  /// Indicates whether the page is currently loading.
  abstract final bool isLoading;

  /// Contains any error message to be displayed.
  abstract final String errorMessage;

  /// Represents the current color, can be null if no color is selected.
  abstract final String? hex;

  /// Creates a [HomePageState].
  const HomePageState();

  /// Creates a copy of this state with the given fields replaced with

  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? hex,
  });
}

/// Concrete implementation of [HomePageState].
class HomePageStateImpl extends HomePageState {
  /// Indicates whether the page is currently loading.
  @override
  final bool isLoading;

  /// Contains any error message to be displayed.
  @override
  final String errorMessage;

  /// Represents the current color, can be null if no color is selected.
  @override
  final String? hex;

  /// List of properties used for equality comparison.
  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        hex,
      ];

  /// Creates a [HomePageStateImpl] with the given parameters.
  const HomePageStateImpl({
    this.isLoading = false,
    this.errorMessage = '',
    this.hex,
  });

  /// Factory constructor to create an initial state.
  ///
  /// @return A new instance of [HomePageStateImpl] with default values.
  factory HomePageStateImpl.initial() => const HomePageStateImpl();

  /// Creates a copy of this state with the given fields replaced
  /// with new values.
  @override
  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? hex,
  }) =>
      HomePageStateImpl(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        hex: hex ?? this.hex,
      );
}
